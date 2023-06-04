# pip install --upgrade google-auth
# pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib

import io, os, ast, sys
import google.auth
import pprint, json

from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from googleapiclient.http import MediaIoBaseDownload

from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.http import MediaIoBaseUpload

hardeep_parmar_google_drive_info_file = 'hardeep.parmar.google_drive.txt'
aanchal_parmar_google_drive_info_file = 'aanchal_parmar_google_drive.txt'
target_file = hardeep_parmar_google_drive_info_file
cs = 'client_secret_1083379240108-c8moccopg5sa6aljdc781vk2eqblg7pn.apps.googleusercontent.com.json'
 
def insertElem(eId , src, dest):
    if any( [ x['id'] == eId for x in dest] ):
        return False
    elem=list(filter(lambda x : x['id'] == eId, src))
    if len(elem) == 1:
        parent=elem[0]['parents'][0]
        insertElem(parent, src, dest)
        dest.append(elem[0])


def listAssets():
    # Load the credentials from the client secret file
    input("Choose source drive...")
    creds_src = InstalledAppFlow.from_client_secrets_file(cs, ['https://www.googleapis.com/auth/drive']).run_local_server(port=0)
 
    # Build the Drive API client
    drive_src = build('drive', 'v3', credentials=creds_src)

    # Use the Drive API client to access the user's files
    results = drive_src.files().list(pageSize=600, fields="nextPageToken, files(id, name)").execute()

    # results = drive.files().list().execute()
    items = results.get('files', [])

    if not items:
        print('No files found.')
    else:
        work_file = open(target_file,'w')
        work_file.write("[" + '\n')
        print('Files:' + str(len(items)))
        indent = ''
        flush = False
        for item in items:
            file_id = item['id']
            file_metadata = drive_src.files().get(fileId=file_id, fields='*').execute()
            if file_metadata['ownedByMe']:
                if file_metadata['mimeType'] == 'application/vnd.google-apps.folder':
                    indent = '<dir>:'
                else:
                    indent = ''
                print(u'{0} {1} ({2})'.format(indent, item['name'], item['id']))
                work_file.write(str(file_metadata) + ',' + '\n')
                flush = True
            else:
                if flush:
                    work_file.flush()
                    flush = False
            # print(file_metadata)
            # (ctime={2})(mtime={3}) , file_metadata['createdTime'], file_metadata['modified_time']) )
        work_file.seek(work_file.tell() - 2, os.SEEK_SET)
        work_file.write( '\n' + "]")
        work_file.close()

def copyAssets():
    # Load the credentials from the client secret file
    input("Choose source drive...")
    creds_src = InstalledAppFlow.from_client_secrets_file(cs, ['https://www.googleapis.com/auth/drive']).run_local_server(port=0)
    input("Choose destination drive...")
    creds_dest = InstalledAppFlow.from_client_secrets_file(cs, ['https://www.googleapis.com/auth/drive']).run_local_server(port=0)

    # Build the Drive API client
    drive_src = build('drive', 'v3', credentials=creds_src)
    drive_dest = build('drive', 'v3', credentials=creds_dest)

    # Use the Drive API client to access the user's files
    results = drive_src.files().list(pageSize=600, fields="nextPageToken, files(id, name)").execute()

    # results = drive.files().list().execute()
    items = results.get('files', [])
    assets = []
    f = open("ordered_Assets.txt","r")
    data = f.read()
    assets=ast.literal_eval(data)
    f.close()
    files_to_Transfer = len(assets)
    if not files_to_Transfer:
        print("No data available")
        return False
    files_to_Transfer = len(assets)
    folder_id_mapping = {}
    for e in assets:
        if e['mimeType'] == 'application/vnd.google-apps.folder':
            folder_metadata = {
            'name'                  : e['name'],
            'mimeType'              : 'application/vnd.google-apps.folder',
            'createdTime'           : e['createdTime'],
            'modifiedTime'          : e['modifiedTime'],
            'viewersCanCopyContent' : e['viewersCanCopyContent'],
            'folderColorRgb'        : e['folderColorRgb']
            }
            pid=e['parents'][0]
            if pid in folder_id_mapping.keys():
                folder_metadata['parents']=[folder_id_mapping[pid]]
            file = drive_dest.files().create(body=folder_metadata, fields='id').execute()
            folder_id_mapping[e['id']] = file.get('id')
        elif files_to_Transfer:
            request = drive_src.files().get_media(fileId=e['id'])
            file = io.BytesIO()
            downloader = MediaIoBaseDownload(file, request)
            try:
                done = False
                while done is False:
                    status, done = downloader.next_chunk()
                    print(F'Download {int(status.progress() * 100)}.')
            except HttpError as error:
                print(F'An error occurred: {error}')
                file = None
            file_metadata = {
            'name'                  : e['name'],
            'mimeType'              : e['mimeType'],
            'createdTime'           : e['createdTime'],
            'modifiedTime'          : e['modifiedTime'],
            'viewersCanCopyContent' : e['viewersCanCopyContent']
            }
            if 'originalFilename' in e.keys(): 
                file_metadata['originalFilename'] = e['originalFilename']

            pid=e['parents'][0]
            if pid in folder_id_mapping.keys():
                file_metadata['parents']=[folder_id_mapping[pid]]
            print(file_metadata)
            if file != None:
                media_body = MediaIoBaseUpload(file, mimetype=e['mimeType'], chunksize=1024*1024, resumable=True)
                drive_dest.files().create(body=file_metadata, media_body=media_body, fields='id').execute()
                files_to_Transfer = files_to_Transfer - 1 
        else:
            print("Skipping...")

def reOrderAssets():
    f = open(target_file,"r"); 
    data = f.read()
    assets = ast.literal_eval(data)
    f.close()
    if not len(assets):
        print("No data available")
        return False
    ordered_Assets = []
    for e in assets:
        insertElem(e['id'],assets, ordered_Assets)
    with open('ordered_Assets.txt','w') as f: 
#        pprint.pprint(ordered_Assets, stream=f, width=8000, compact=True, sort_dicts=False)
        print("[", file=f)
        print(*ordered_Assets, sep=',\n', file=f)
        print("]", file=f)
        f.close()

listAssets()
reOrderAssets()
copyAssets()

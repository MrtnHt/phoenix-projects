import gradio as gr
import os
import requests
import base64

def trigger_remote_build():
    # Gebruikt jouw specifieke secret naam
    token = os.environ.get('Phoenix_Remote_Trigger')
    repo = 'MrtnHt/phoenix-projects'
    path = 'remote_trigger.txt'
    
    if not token:
        return '❌ Secret NIET gevonden! Controleer of de naam Phoenix_Remote_Trigger is in HF Settings.'

    url = f'https://api.github.com/repos/{repo}/contents/{path}'
    headers = {'Authorization': f'token {token}'}
    
    # Haal SHA op voor bestaand bestand
    res = requests.get(url, headers=headers)
    sha = res.json().get('sha') if res.status_code == 200 else None
    
    data = {
        'message': 'Remote Trigger via Phoenix_Remote_Trigger',
        'content': base64.b64encode(b'START_BUILD').decode('utf-8'),
        'branch': 'main'
    }
    if sha: data['sha'] = sha
    
    put_res = requests.put(url, headers=headers, json=data)
    if put_res.status_code in [200, 201]:
        return '🚀 Signaal VERZONDEN! Kijk nu in je Termux terminal...'
    else:
        return f'❌ API Fout: {put_res.text}'

# Thema verplaatst naar launch() volgens Gradio 6.0 logs
with gr.Blocks() as demo:
    gr.Markdown('# 🦅 PHOENIX: REMOTE BRIDGE V46')
    gr.Markdown('Status: **Verbonden met Phoenix_Remote_Trigger**')
    gr.Button('START REMOTE BUILD', variant='primary').click(trigger_remote_build, outputs=gr.Markdown())

demo.launch(theme='glass')

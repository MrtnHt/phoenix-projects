import gradio as gr
import os
import subprocess

PROJECT_PATH = '/root/project_folder'

def deploy():
    try:
        os.system('eval $(ssh-agent -s) && ssh-add /root/.ssh/id_rsa')
        subprocess.run(['git', 'add', '.'], cwd=PROJECT_PATH, check=True)
        subprocess.run(['git', 'commit', '-m', 'Phoenix Build'], cwd=PROJECT_PATH, check=True)
        subprocess.run(['git', 'push', '-u', 'origin', 'main'], cwd=PROJECT_PATH, check=True)
        return '🚀 SUCCES: Gepusht naar MrtnHt/phoenix-projects!'
    except Exception as e:
        return f'❌ FOUT: {str(e)}'

with gr.Blocks() as demo:
    gr.Markdown(f'# 🦅 PHOENIX: FACTORY\nPad: {PROJECT_PATH}')
    gr.Button('PUSH NAAR GITHUB').click(deploy, outputs=gr.Markdown())
demo.launch()

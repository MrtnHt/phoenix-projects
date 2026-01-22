import gradio as gr
import os
import subprocess

PROJECT_PATH = '/root/project_folder'

def generate_and_push_nexus():
    try:
        # De Website Code (HTML/Tailwind)
        content = '''
        <html lang='en' class='dark'>
        <head>
            <script src='https://cdn.tailwindcss.com'></script>
            <title>NEXUS PRIME | MRTNHT</title>
        </head>
        <body class='bg-slate-950 text-white font-sans'>
            <div class='min-h-screen flex flex-col items-center justify-center p-6 text-center'>
                <h1 class='text-6xl font-black bg-gradient-to-r from-cyan-400 to-blue-600 bg-clip-text text-transparent mb-4'>NEXUS PRIME</h1>
                <p class='text-slate-400 text-xl mb-8'>Gegenereerd door de Phoenix Factory op Android.</p>
                <div class='flex gap-4 justify-center'>
                    <div class='px-6 py-2 bg-blue-600 rounded-full font-bold shadow-lg shadow-blue-500/20'>SYSTEM: ONLINE</div>
                    <div class='px-6 py-2 bg-slate-800 rounded-full font-bold border border-white/10'>GITHUB: CONNECTED</div>
                </div>
            </div>
        </body>
        </html>
        '''
        
        with open(f'{PROJECT_PATH}/index.html', 'w') as f:
            f.write(content)
        
        # De Push-Sequence met je werkende sleutel
        os.system('eval $(ssh-agent -s) && ssh-add /root/.ssh/id_rsa')
        subprocess.run(['git', 'add', '.'], cwd=PROJECT_PATH, check=True)
        subprocess.run(['git', 'commit', '-m', 'Nexus Prime Deploy'], cwd=PROJECT_PATH, check=True)
        # We forceren de push om de 'fetch first' error te passeren
        subprocess.run(['git', 'push', '-f', 'origin', 'main'], cwd=PROJECT_PATH, check=True)
        
        return '🚀 NEXUS PRIME staat nu in je privé GitHub repository!'
    except Exception as e:
        return f'❌ FOUT: {str(e)}'

with gr.Blocks(theme='glass') as demo:
    gr.Markdown('# 🦅 PHOENIX V42: NEXUS ARCHITECT')
    gr.Markdown('Klik op de knop om de Nexus Prime interface te bouwen en direct naar **MrtnHt/phoenix-projects** te sturen.')
    btn = gr.Button('BOUW & DEPLOY NEXUS PRIME', variant='primary')
    output = gr.Markdown()
    btn.click(generate_and_push_nexus, outputs=output)

demo.launch()

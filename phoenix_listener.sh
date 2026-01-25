PROJECT_PATH='/root/project_folder'
cd $PROJECT_PATH

echo '🦅 Phoenix Listener is actief... Wachten op signaal van MrtnHt...'

while true; do
    # 1. Check de brievenbus (GitHub)
    eval $(ssh-agent -s) > /dev/null
    ssh-add /root/.ssh/id_rsa > /dev/null 2>&1
    git pull origin main > /dev/null 2>&1

    # 2. Is er een trigger?
    if [ -f 'remote_trigger.txt' ]; then
        echo '📦 Signaal ontvangen! Nexus Prime wordt nu gebouwd...'
        
        # Veilige HTML generatie
        echo '<!DOCTYPE html><html><body style="background:#0f172a;color:white;text-align:center;padding:50px;font-family:sans-serif;"><h1 style="font-size:4rem;color:#38bdf8;">NEXUS PRIME</h1><p>Remote Bridge V43 is LIVE!</p></body></html>' > index.html
        
        # Push resultaat en ruim op
        git add .
        git commit -m 'Nexus Prime: Remote Build Voltooid'
        rm remote_trigger.txt
        git add remote_trigger.txt
        git commit -m 'Trigger verwerkt'
        git push origin main
        
        echo '✅ Alles gepusht naar GitHub!'
    fi
    sleep 10
done

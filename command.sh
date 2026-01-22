# Forceer de juiste mappenstructuur op je telefoon
proot-distro login ubuntu -- bash -c "
mkdir -p /root/public_site
cd /root/public_site

# Initialiseer de repo als dat nog niet gedaan is
if [ ! -d .git ]; then
    git init
    git remote add origin git@github.com:MrtnHt/phoenix-projects.git
fi

# Maak de V51 Webapp opnieuw aan in de JUISTE map
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang='nl'>
<head><script src='https://cdn.tailwindcss.com'></script><title>PHOENIX V51</title></head>
<body class='bg-black text-white flex items-center justify-center min-h-screen'>
    <div class='p-10 bg-white/5 border border-cyan-500 rounded-3xl text-center'>
        <h1 class='text-5xl font-black text-cyan-400 mb-4'>V51 IS LIVE</h1>
        <p class='text-slate-400'>De Phoenix Bridge werkt nu vlekkeloos.</p>
    </div>
</body>
</html>
EOF

# Push naar de juiste plek
eval \$(ssh-agent -s)
ssh-add /root/.ssh/id_rsa
git add index.html
git commit -m 'Fix: Webapp V51 naar juiste map'
git push -f origin main
"

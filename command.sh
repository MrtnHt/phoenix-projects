# Maak de mappen aan, fix de git repo en haal de nieuwste code op
proot-distro login ubuntu -- bash -c "
mkdir -p /root/public_site && 
cd /root/public_site && 
git init && 
git remote add origin git@github.com:MrtnHt/phoenix-projects.git || true && 
git pull origin main && 
echo '✅ Telefoon mappen hersteld en gesynchroniseerd!'"
# 1. Ga naar de publieke map op je telefoon
cd /root/public_site

# 2. Genereer de nieuwe 'Grand Opening' pagina
cat << 'EOF_GRAND' > index.html
<!DOCTYPE html>
<html lang="nl" class="dark">
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>MRTNHT | PHOENIX LIVE</title>
</head>
<body class="bg-black text-slate-300 font-sans selection:bg-cyan-500/30">
    <div class="max-w-4xl mx-auto px-6 py-24">
        <div class="flex items-center gap-2 mb-12 bg-white/5 w-fit px-4 py-2 rounded-full border border-white/10">
            <span class="relative flex h-2 w-2">
                <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-cyan-400 opacity-75"></span>
                <span class="relative inline-flex rounded-full h-2 w-2 bg-cyan-500"></span>
            </span>
            <span class="text-xs font-mono uppercase tracking-widest text-cyan-400">System Live: Teteringen Node</span>
        </div>

        <h1 class="text-8xl font-black text-white mb-6 tracking-tighter">PHOENIX <span class="text-cyan-500">FACTORY</span></h1>
        
        <p class="text-2xl text-slate-400 mb-16 leading-relaxed max-w-2xl font-light">
            Dit is de publieke interface van een autonoom AI-ecosysteem, volledig aangestuurd via <span class="text-white border-b border-cyan-500/50">Android hardware</span>.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div class="group p-8 bg-gradient-to-br from-white/5 to-transparent border border-white/10 rounded-[2.5rem] hover:border-cyan-500/50 transition-all">
                <h3 class="text-white font-bold text-xl mb-3">Remote Bridge</h3>
                <p class="text-slate-500 text-sm mb-6">Gekoppeld via Hugging Face & GitHub API voor real-time command uitvoering.</p>
                <div class="text-cyan-500 font-mono text-xs uppercase tracking-widest">Connected</div>
            </div>
            <div class="group p-8 bg-gradient-to-br from-white/5 to-transparent border border-white/10 rounded-[2.5rem] hover:border-purple-500/50 transition-all">
                <h3 class="text-white font-bold text-xl mb-3">Local Engine</h3>
                <p class="text-slate-500 text-sm mb-6">Ubuntu 22.04 LTS draaiend in een beveiligde container op ARM-architectuur.</p>
                <div class="text-purple-500 font-mono text-xs uppercase tracking-widest">Optimal</div>
            </div>
        </div>

        <footer class="mt-24 pt-12 border-t border-white/5 flex justify-between items-center text-[10px] font-mono text-slate-700 uppercase tracking-[0.2em]">
            <div>© 2026 MrtnHt Projects</div>
            <div>Built on Termux / Proot-Distro</div>
        </footer>
    </div>
</body>
</html>
EOF_GRAND

# 3. Activeer SSH en Push de site live
eval $(ssh-agent -s)
ssh-add /root/.ssh/id_rsa
git add .
git commit -m "Grand Opening: Phoenix is Live"
git push origin main

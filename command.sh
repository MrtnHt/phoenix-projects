# Ga naar de actieve publicatie map op je telefoon
cd /root/public_site

# Bouw de Webapp: "Phoenix OS Dashboard"
cat << 'EOF_WEBAPP' > index.html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>PHOENIX OS | WEBAPP</title>
    <style>
        @keyframes pulse-cyan { 0% { box-shadow: 0 0 0 0 rgba(6, 182, 212, 0.4); } 70% { box-shadow: 0 0 0 10px rgba(6, 182, 212, 0); } 100% { box-shadow: 0 0 0 0 rgba(6, 182, 212, 0); } }
        .status-pulse { animation: pulse-cyan 2s infinite; }
    </style>
</head>
<body class="bg-[#050505] text-white font-sans min-h-screen flex flex-col items-center justify-center p-6">
    <div class="max-w-md w-full bg-[#0a0a0a] border border-white/10 rounded-[3rem] p-8 shadow-2xl overflow-hidden relative">
        <div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-cyan-500 to-purple-500"></div>
        
        <header class="mb-8">
            <h2 class="text-xs font-mono text-cyan-500 tracking-[0.3em] uppercase mb-2">Command Center V51</h2>
            <h1 class="text-4xl font-black tracking-tighter">NEXUS <span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-500 font-light">PRIME</span></h1>
        </header>

        <div class="space-y-4">
            <div class="p-6 bg-white/5 rounded-2xl border border-white/5 flex items-center justify-between">
                <div>
                    <div class="text-sm font-bold text-white">Engine Status</div>
                    <div class="text-[10px] text-slate-500 uppercase tracking-widest mt-1">Ubuntu Container</div>
                </div>
                <div class="h-3 w-3 rounded-full bg-cyan-500 status-pulse"></div>
            </div>

            <div class="p-6 bg-white/5 rounded-2xl border border-white/5">
                <div class="flex justify-between mb-4">
                    <span class="text-sm font-bold">Bridge Connectivity</span>
                    <span class="text-[10px] text-cyan-400 font-mono italic text-xs uppercase tracking-widest">Active</span>
                </div>
                <div class="w-full bg-white/10 h-1.5 rounded-full overflow-hidden">
                    <div class="bg-cyan-500 h-full w-[85%] transition-all duration-1000"></div>
                </div>
            </div>

            <button onclick="alert('Opdracht ontvangen via Remote Bridge!')" class="w-full py-4 bg-white text-black font-black rounded-2xl text-xs uppercase tracking-widest hover:bg-cyan-400 transition-colors">
                Test Remote Trigger
            </button>
        </div>

        <footer class="mt-8 pt-6 border-t border-white/5 text-center">
            <p class="text-[9px] text-slate-600 font-mono tracking-widest">ENCRYPTED DATA FLOW: DEVICE -> GITHUB -> CLOUD</p>
        </footer>
    </div>
</body>
</html>
EOF_WEBAPP

# Push de Webapp direct live
eval $(ssh-agent -s)
ssh-add /root/.ssh/id_rsa
git add index.html
git commit -m "Deploy: Webapp Command Test V51"
git push origin main

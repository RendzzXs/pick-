#!/bin/bash

# -------------------------------
# RENDZZ UNIQUE EDITION - BUKAN KOTAK BIASA!
# -------------------------------
PTERO_DIR="/var/www/pterodactyl"
TARGET_FILE="$PTERO_DIR/resources/views/templates/base/core.blade.php"
FOOTER_FILE="$PTERO_DIR/resources/views/templates/base/footer.blade.php"
SERVER_FILE="$PTERO_DIR/resources/views/templates/base/server.blade.php"
DASHBOARD_FILE="$PTERO_DIR/resources/scripts/components/dashboard/DashboardContainer.tsx"
BACKUP_FILE="$PTERO_DIR/core.backup"
WALLPAPER_DIR="$PTERO_DIR/public/rendzz"
WALLPAPER_FILE="$WALLPAPER_DIR/bg.jpg"
LOADING_FILE="$PTERO_DIR/resources/views/loading.blade.php"
ROUTE_FILE="$PTERO_DIR/routes/web.php"
CONTROLLER_FILE="$PTERO_DIR/app/Http/Controllers/LoadingController.php"

# Warna
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# -------------------------------
# FUNCTION: HEADER
# -------------------------------
show_header() {
    clear
    echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                                                        ║${NC}"
    echo -e "${CYAN}║${WHITE}          🔥 RENDZZ UNIQUE  🔥              ${CYAN}║${NC}"
    echo -e "${CYAN}║${WHITE}                  ✨ + LOADING PAGE ✨              ${CYAN}║${NC}"
    echo -e "${CYAN}║                                                        ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# -------------------------------
# FUNCTION: CREATE LOADING CONTROLLER
# -------------------------------
create_loading_controller() {
    mkdir -p "$PTERO_DIR/app/Http/Controllers"
    cat > "$CONTROLLER_FILE" << 'EOF'
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LoadingController extends Controller
{
    public function showLoading()
    {
        return view('loading');
    }
}
EOF
    echo -e "${GREEN}✅ Loading Controller dibuat${NC}"
}

# -------------------------------
# FUNCTION: CREATE LOADING VIEW
# -------------------------------
create_loading_view() {
    cat > "$LOADING_FILE" << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔐 Verifikasi Keamanan</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #0a0e17;
            overflow: hidden;
            position: relative;
        }

        /* Background dengan efek glow */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background: 
                radial-gradient(ellipse at 20% 50%, rgba(78, 205, 196, 0.1) 0%, transparent 50%),
                radial-gradient(ellipse at 80% 50%, rgba(255, 107, 107, 0.08) 0%, transparent 50%),
                radial-gradient(ellipse at 50% 100%, rgba(78, 205, 196, 0.05) 0%, transparent 40%);
            z-index: 0;
        }

        /* Bintang-bintang kecil */
        .stars {
            position: fixed;
            inset: 0;
            z-index: 0;
            pointer-events: none;
        }

        .star {
            position: absolute;
            width: 2px;
            height: 2px;
            background: white;
            border-radius: 50%;
            animation: twinkle var(--duration) ease-in-out infinite alternate;
        }

        @keyframes twinkle {
            0% { opacity: 0.2; transform: scale(0.8); }
            100% { opacity: 1; transform: scale(1.2); }
        }

        .container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 480px;
            padding: 20px;
        }

        .loading-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.06);
            border-radius: 32px;
            padding: 50px 40px 45px;
            text-align: center;
            box-shadow: 
                0 30px 80px rgba(0, 0, 0, 0.5),
                inset 0 1px 0 rgba(255, 255, 255, 0.05);
            transition: all 0.5s ease;
        }

        .loading-card.verified {
            border-color: rgba(78, 205, 196, 0.3);
            box-shadow: 
                0 30px 80px rgba(0, 0, 0, 0.5),
                0 0 60px rgba(78, 205, 196, 0.05),
                inset 0 1px 0 rgba(255, 255, 255, 0.05);
        }

        /* Icon / Shield */
        .shield-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 24px;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .shield-icon svg {
            width: 100%;
            height: 100%;
            filter: drop-shadow(0 0 30px rgba(78, 205, 196, 0.15));
            transition: all 0.8s ease;
        }

        .shield-icon .shield-bg {
            position: absolute;
            inset: 0;
            border-radius: 50%;
            background: radial-gradient(circle at center, rgba(78, 205, 196, 0.05), transparent 70%);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.3); opacity: 0.8; }
        }

        .title {
            font-size: 22px;
            font-weight: 700;
            color: white;
            margin-bottom: 8px;
            letter-spacing: -0.3px;
        }

        .subtitle {
            font-size: 14px;
            font-weight: 400;
            color: rgba(255, 255, 255, 0.4);
            margin-bottom: 32px;
            letter-spacing: 0.5px;
        }

        /* Progress Bar */
        .progress-wrapper {
            margin: 0 auto 16px;
            max-width: 280px;
        }

        .progress-bar-track {
            width: 100%;
            height: 4px;
            background: rgba(255, 255, 255, 0.06);
            border-radius: 4px;
            overflow: hidden;
            position: relative;
        }

        .progress-bar-fill {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #4ecdc4, #44a08d);
            border-radius: 4px;
            transition: width 0.15s linear;
            box-shadow: 0 0 20px rgba(78, 205, 196, 0.3);
        }

        .progress-text {
            font-size: 12px;
            color: rgba(255, 255, 255, 0.25);
            font-weight: 500;
            letter-spacing: 0.5px;
            margin-top: 10px;
            font-variant-numeric: tabular-nums;
        }

        /* Status Messages */
        .status-message {
            margin-top: 20px;
            min-height: 24px;
            font-size: 13px;
            font-weight: 400;
            color: rgba(255, 255, 255, 0.3);
            transition: all 0.4s ease;
        }

        .status-message.active {
            color: rgba(255, 255, 255, 0.6);
        }

        .status-message.success {
            color: #4ecdc4;
        }

        /* Checkmark verified */
        .checkmark {
            display: none;
            margin: 16px auto 0;
            width: 48px;
            height: 48px;
            background: rgba(78, 205, 196, 0.1);
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            border: 1px solid rgba(78, 205, 196, 0.2);
            animation: popIn 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
        }

        .checkmark.show {
            display: flex;
        }

        @keyframes popIn {
            0% { transform: scale(0); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        .checkmark svg {
            width: 28px;
            height: 28px;
            color: #4ecdc4;
        }

        /* Loading dots */
        .dots {
            display: inline-flex;
            gap: 4px;
            margin-left: 4px;
        }

        .dot {
            width: 6px;
            height: 6px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            animation: dotBounce 1.4s ease-in-out infinite both;
        }

        .dot:nth-child(1) { animation-delay: 0s; }
        .dot:nth-child(2) { animation-delay: 0.2s; }
        .dot:nth-child(3) { animation-delay: 0.4s; }

        @keyframes dotBounce {
            0%, 80%, 100% { transform: scale(0.6); opacity: 0.3; }
            40% { transform: scale(1); opacity: 0.8; }
        }

        /* Glow orb */
        .glow-orb {
            position: fixed;
            width: 400px;
            height: 400px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(78, 205, 196, 0.03), transparent 70%);
            top: -100px;
            right: -100px;
            z-index: 0;
            pointer-events: none;
            animation: floatOrb 8s ease-in-out infinite alternate;
        }

        .glow-orb-2 {
            position: fixed;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(255, 107, 107, 0.02), transparent 70%);
            bottom: -80px;
            left: -80px;
            z-index: 0;
            pointer-events: none;
            animation: floatOrb 10s ease-in-out infinite alternate-reverse;
        }

        @keyframes floatOrb {
            0% { transform: translate(0, 0) scale(1); }
            100% { transform: translate(30px, 20px) scale(1.1); }
        }

        /* Responsive */
        @media (max-width: 500px) {
            .loading-card {
                padding: 35px 24px 30px;
            }
            .shield-icon {
                width: 60px;
                height: 60px;
            }
            .title {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <!-- Glow Orbs -->
    <div class="glow-orb"></div>
    <div class="glow-orb-2"></div>

    <!-- Stars -->
    <div class="stars" id="stars"></div>

    <div class="container">
        <div class="loading-card" id="loadingCard">
            <!-- Shield Icon -->
            <div class="shield-icon">
                <div class="shield-bg"></div>
                <svg viewBox="0 0 24 24" fill="none" stroke="rgba(255,255,255,0.6)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                    <path d="M9 12l2 2 4-4" stroke="#4ecdc4" stroke-width="2"/>
                </svg>
            </div>

            <!-- Title -->
            <h1 class="title">Verifikasi Keamanan</h1>
            <p class="subtitle">Memastikan koneksi Anda aman</p>

            <!-- Progress -->
            <div class="progress-wrapper">
                <div class="progress-bar-track">
                    <div class="progress-bar-fill" id="progressFill"></div>
                </div>
                <div class="progress-text" id="progressText">0%</div>
            </div>

            <!-- Status Message -->
            <div class="status-message" id="statusMessage">
                <span>Memverifikasi perangkat</span>
                <span class="dots">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </span>
            </div>

            <!-- Checkmark -->
            <div class="checkmark" id="checkmark">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M20 6L9 17l-5-5"/>
                </svg>
            </div>
        </div>
    </div>

    <script>
        (function() {
            // Generate stars
            const starsContainer = document.getElementById('stars');
            for (let i = 0; i < 80; i++) {
                const star = document.createElement('div');
                star.className = 'star';
                star.style.left = Math.random() * 100 + '%';
                star.style.top = Math.random() * 100 + '%';
                star.style.width = (Math.random() * 2 + 1) + 'px';
                star.style.height = star.style.width;
                star.style.setProperty('--duration', (Math.random() * 3 + 2) + 's');
                star.style.animationDelay = (Math.random() * 3) + 's';
                starsContainer.appendChild(star);
            }

            // Status messages (biar keliatan pura-pura verifikasi)
            const messages = [
                'Memverifikasi perangkat',
                'Mengecek koneksi jaringan',
                'Memvalidasi sertifikat SSL',
                'Menghubungkan ke server aman',
                'Memproses data enkripsi',
                'Verifikasi identitas selesai'
            ];

            let currentStep = 0;
            const progressFill = document.getElementById('progressFill');
            const progressText = document.getElementById('progressText');
            const statusMessage = document.getElementById('statusMessage');
            const checkmark = document.getElementById('checkmark');
            const loadingCard = document.getElementById('loadingCard');

            let progress = 0;

            function updateLoading() {
                if (progress >= 100) {
                    // Selesai - tampilkan checkmark dan redirect
                    statusMessage.innerHTML = '<span style="color: #4ecdc4;">✓ Verifikasi berhasil! Mengalihkan...</span>';
                    statusMessage.className = 'status-message success';
                    checkmark.classList.add('show');
                    loadingCard.classList.add('verified');
                    
                    // Redirect ke dashboard setelah delay
                    setTimeout(function() {
                        window.location.href = '/dashboard';
                    }, 800);
                    return;
                }

                // Update progress
                progress += Math.random() * 3 + 1.5;
                if (progress > 100) progress = 100;
                progressFill.style.width = progress + '%';
                progressText.textContent = Math.round(progress) + '%';

                // Update status message (tiap 15-20%)
                const stepIndex = Math.min(
                    Math.floor(progress / 18),
                    messages.length - 1
                );
                if (stepIndex !== currentStep) {
                    currentStep = stepIndex;
                    const msg = messages[stepIndex] || messages[messages.length - 1];
                    statusMessage.innerHTML = msg + 
                        ' <span class="dots"><span class="dot"></span><span class="dot"></span><span class="dot"></span></span>';
                    statusMessage.className = 'status-message active';
                }

                // Continue
                const delay = Math.random() * 150 + 180;
                setTimeout(updateLoading, delay);
            }

            // Start after small delay
            setTimeout(updateLoading, 600);
        })();
    </script>

</body>
</html>
EOF
    echo -e "${GREEN}✅ Loading page dibuat${NC}"
}

# -------------------------------
# FUNCTION: UPDATE ROUTES
# -------------------------------
update_routes() {
    # Cek apakah route sudah ada
    if grep -q "loading" "$ROUTE_FILE" 2>/dev/null; then
        echo -e "${YELLOW}⚠️  Route loading sudah ada, skip...${NC}"
        return 0
    fi
    
    # Backup route
    cp "$ROUTE_FILE" "$ROUTE_FILE.bak" 2>/dev/null
    
    # Tambahkan route di bagian atas sebelum route yang ada
    cat > "$ROUTE_FILE.new" << 'EOF'
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoadingController;

// ============================================
// RENDZZ LOADING PAGE - Verifikasi Keamanan
// ============================================
Route::get('/', [LoadingController::class, 'showLoading'])->name('loading');

// ============================================
// ROUTE BAWAHAN (ASLI PTERODACTYL)
// ============================================
EOF

    # Append route asli (skip baris pertama <?php)
    tail -n +2 "$ROUTE_FILE" >> "$ROUTE_FILE.new" 2>/dev/null
    
    mv "$ROUTE_FILE.new" "$ROUTE_FILE"
    echo -e "${GREEN}✅ Route diupdate: Halaman utama → Loading page${NC}"
}

# -------------------------------
# FUNCTION: HAPUS WALLPAPER & LOADING
# -------------------------------
uninstall_wallpaper() {
    show_header
    echo -e "${YELLOW}🗑️  Menghapus custom design & loading page...${NC}\n"
    
    # Hapus folder wallpaper
    if [ -d "$WALLPAPER_DIR" ]; then
        rm -rf "$WALLPAPER_DIR"
        echo -e "${GREEN}✅ Folder wallpaper dihapus${NC}"
    fi
    
    # Hapus loading file
    if [ -f "$LOADING_FILE" ]; then
        rm -f "$LOADING_FILE"
        echo -e "${GREEN}✅ Loading page dihapus${NC}"
    fi
    
    # Hapus controller
    if [ -f "$CONTROLLER_FILE" ]; then
        rm -f "$CONTROLLER_FILE"
        echo -e "${GREEN}✅ Loading controller dihapus${NC}"
    fi
    
    # Restore route
    if [ -f "$ROUTE_FILE.bak" ]; then
        mv "$ROUTE_FILE.bak" "$ROUTE_FILE"
        echo -e "${GREEN}✅ Route dikembalikan${NC}"
    fi
    
    # Kembalikan core.blade.php ke default
    cat > "$TARGET_FILE" << 'EOF'
@extends('templates/wrapper', [
    'css' => ['body' => 'bg-neutral-800'],
])

@section('container')
    <div id="modal-portal"></div>
    <div id="app"></div>
@endsection
EOF
    
    # Kembalikan footer ke default
    if [ -f "$FOOTER_FILE" ]; then
        sed -i 's/Rendzz Official®/Pterodactyl®/g' "$FOOTER_FILE"
        sed -i 's/© 2025 - 2026/© 2015 - 2026/g' "$FOOTER_FILE"
    fi
    
    # Clear cache
    cd "$PTERO_DIR" 2>/dev/null
    php artisan view:clear
    php artisan cache:clear
    php artisan config:clear
    php artisan route:clear
    
    echo -e "\n${GREEN}✅ Panel kembali normal!${NC}"
}

# -------------------------------
# FUNCTION: INSTALL WALLPAPER + LOADING + UNIQUE DESIGN
# -------------------------------
install_wallpaper() {
    show_header
    
    # Input URL
    echo -e "${YELLOW}📸 Masukkan URL wallpaper:${NC}"
    echo -n "➤ "
    read WALLPAPER_URL
    
    # Validasi URL
    if [ -z "$WALLPAPER_URL" ]; then
        echo -e "\n${RED}❌ URL tidak boleh kosong!${NC}"
        return 1
    fi
    
    # Backup
    cp "$TARGET_FILE" "$BACKUP_FILE" 2>/dev/null
    cp "$ROUTE_FILE" "$ROUTE_FILE.bak" 2>/dev/null
    
    # Download wallpaper
    echo -e "\n${YELLOW}📥 Downloading wallpaper...${NC}"
    mkdir -p "$WALLPAPER_DIR"
    curl -L "$WALLPAPER_URL" -o "$WALLPAPER_FILE" --progress-bar
    
    if [ ! -f "$WALLPAPER_FILE" ]; then
        echo -e "\n${RED}❌ Gagal download wallpaper!${NC}"
        return 1
    fi
    
    chmod 644 "$WALLPAPER_FILE"
    chown -R www-data:www-data "$WALLPAPER_DIR" 2>/dev/null || \
    chown -R nginx:nginx "$WALLPAPER_DIR" 2>/dev/null
    
    echo -e "${GREEN}✅ Wallpaper tersimpan${NC}\n"
    
    # -------------------------------
    # CREATE LOADING PAGE
    # -------------------------------
    echo -e "${YELLOW}🔄 Membuat loading page...${NC}"
    create_loading_controller
    create_loading_view
    update_routes
    
    # -------------------------------
    # GANTI COPYRIGHT FOOTER
    # -------------------------------
    echo -e "${YELLOW}©️  Mengganti copyright footer...${NC}"
    
    cp "$FOOTER_FILE" "$FOOTER_FILE.bak" 2>/dev/null
    
    sed -i 's/Pterodactyl®/Rendzz Official®/g' "$FOOTER_FILE"
    sed -i 's/Pterodactyl/Rendzz Official/g' "$FOOTER_FILE"
    sed -i 's/© 2015 - 2026/© 2025 - 2026/g' "$FOOTER_FILE"
    sed -i 's/© [0-9]\{4\} - [0-9]\{4\}/© 2025 - 2026/g' "$FOOTER_FILE"
    
    echo -e "${GREEN}✅ Footer: Rendzz Official® © 2025 - 2026${NC}\n"
    
    # -------------------------------
    # INJECT CORE BLADE - UNIQUE DESIGN
    # -------------------------------
    echo -e "${YELLOW}🎨 Menginjeksi unique design...${NC}"
    
    cat > "$TARGET_FILE" << 'EOF'
@extends('templates/wrapper', [
    'css' => ['body' => 'bg-neutral-800'],
])

@section('container')
    <div id="modal-portal"></div>
    <div id="app"></div>

    <style>
        /* ======================================= */
        /*   RENDZZ UNIQUE EDITION                */
        /*   Bukan Kotak Biasa!                  */
        /* ======================================= */

        /* BACKGROUND */
        body {
            background: url('/rendzz/bg.jpg') no-repeat center center fixed !important;
            background-size: cover !important;
        }

        /* OVERLAY TIPIS - NO BLUR BERLEBIHAN */
        body::after {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2);
            pointer-events: none;
            z-index: 1;
        }

        #app, .content-wrapper {
            position: relative;
            z-index: 2;
        }

        /* ======================================= */
        /*   SERVER CARD - BUKAN KOTAK BIASA!     */
        /* ======================================= */
        
        /* ANIMASI MASUK DARI KIRI */
        @keyframes slideInLeft {
            0% {
                opacity: 0;
                transform: translateX(-50px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* CARD SERVER - BENTUK HEXAGON! */
        .card {
            background: rgba(255, 255, 255, 0.9) !important;
            border: none !important;
            border-radius: 20px 8px 20px 8px !important;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15) !important;
            transition: all 0.3s ease !important;
            animation: slideInLeft 0.6s ease-out !important;
            position: relative;
            overflow: hidden;
        }

        /* GARIS DEKORATIF */
        .card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(180deg, #ff6b6b, #4ecdc4);
            border-radius: 20px 0 0 8px;
        }

        /* HOVER EFEK - NAIK & BAYANGAN */
        .card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25) !important;
            background: white !important;
        }

        /* CARD BODY */
        .card-body {
            padding: 1.5rem !important;
        }

        /* TITLE SERVER */
        .card-title {
            font-weight: 700 !important;
            color: #2d3748 !important;
            border-bottom: 2px dashed #4ecdc4;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }

        /* ======================================= */
        /*   SIDEBAR - MODERN                        */
        /* ======================================= */
        .main-sidebar {
            background: rgba(26, 32, 44, 0.85) !important;
            border-right: none !important;
            box-shadow: 5px 0 25px rgba(0, 0, 0, 0.2) !important;
        }

        .nav-link {
            border-radius: 12px !important;
            margin: 5px 15px !important;
            transition: all 0.2s ease;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1) !important;
            transform: translateX(5px);
        }

        /* ======================================= */
        /*   NAVBAR - CLEAN                          */
        /* ======================================= */
        .main-header {
            background: rgba(255, 255, 255, 0.85) !important;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1) !important;
            border-bottom: none !important;
        }

        .dark-mode .main-header {
            background: rgba(26, 32, 44, 0.85) !important;
        }

        /* ======================================= */
        /*   BUTTON - CIRCLE                        */
        /* ======================================= */
        .btn {
            border-radius: 50px !important;
            padding: 8px 20px !important;
            font-weight: 600 !important;
            transition: all 0.2s ease !important;
        }

        .btn-primary {
            background: linear-gradient(145deg, #4ecdc4, #556270) !important;
            border: none !important;
            box-shadow: 0 4px 15px rgba(78, 205, 196, 0.3) !important;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(78, 205, 196, 0.4) !important;
        }

        /* ======================================= */
        /*   MODAL - UNIK                          */
        /* ======================================= */
        .modal-content {
            border-radius: 30px 10px 30px 10px !important;
            border: none !important;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3) !important;
        }

        .modal-header {
            border-bottom: 2px dashed #4ecdc4 !important;
            border-radius: 30px 10px 0 0 !important;
        }

        /* ======================================= */
        /*   DARK MODE                             */
        /* ======================================= */
        .dark-mode .card {
            background: rgba(26, 32, 44, 0.85) !important;
            color: white !important;
        }

        .dark-mode .card-title {
            color: white !important;
            border-bottom: 2px dashed #4ecdc4;
        }

        .dark-mode .main-header {
            background: rgba(26, 32, 44, 0.85) !important;
        }

        /* ======================================= */
        /*   WATERMARK MINIMAL                       */
        /* ======================================= */
        body::before {
            content: "RENDZZ";
            position: fixed;
            bottom: 15px;
            right: 25px;
            color: rgba(255, 255, 255, 0.2);
            font-size: 20px;
            font-weight: 800;
            letter-spacing: 10px;
            z-index: 999;
            pointer-events: none;
            text-shadow: 0 0 15px rgba(0,0,0,0.3);
        }
    </style>
@endsection
EOF

    # -------------------------------
    # GANTI TITLE PANEL
    # -------------------------------
    sed -i 's/<title>.*<\/title>/<title>🔥 Rendzz Unique Edition 🔥<\/title>/g' "$PTERO_DIR/resources/views/layouts/admin.blade.php" 2>/dev/null
    sed -i 's/<title>.*<\/title>/<title>🔥 Rendzz Unique Edition 🔥<\/title>/g' "$PTERO_DIR/resources/views/layouts/auth.blade.php" 2>/dev/null
    
    # -------------------------------
    # CLEAR CACHE
    # -------------------------------
    cd "$PTERO_DIR" 2>/dev/null
    php artisan view:clear
    php artisan cache:clear
    php artisan config:clear
    php artisan route:clear
    php artisan route:cache
    
    # -------------------------------
    # SUCCESS MESSAGE
    # -------------------------------
    echo -e "\n${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║           ✅ INSTALLASI UNIQUE BERHASIL! ✅          ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
    echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}🖼️  Wallpaper   : ${NC}CUSTOM"
    echo -e "${PURPLE}🃏 Server Card  : ${NC}Hexagon style (20px 8px 20px 8px)"
    echo -e "${BLUE}🎬 Animasi      : ${NC}Slide In Left + Hover naik"
    echo -e "${YELLOW}⚪ Button       : ${NC}Bulat (50px radius)"
    echo -e "${GREEN}©️  Footer       : ${NC}Rendzz Official® © 2025-2026"
    echo -e "${CYAN}🔄 Loading Page  : ${NC}Verifikasi keamanan sebelum masuk panel"
    echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}🚀 Akses panel: https://domain.com/ (otomatis ke loading page)${NC}"
    echo -e "${GREEN}🚀 Refresh browser (CTRL+SHIFT+R)!${NC}"
}

# -------------------------------
# MAIN MENU
# -------------------------------
while true; do
    show_header
    echo -e "${WHITE}╔════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║           🔥 PILIH MENU 🔥               ║${NC}"
    echo -e "${WHITE}╠════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║                                          ║${NC}"
    echo -e "${WHITE}║  ${RED}[1]${NC} 🗑️  HAPUS - Balik Normal         ${WHITE}║${NC}"
    echo -e "${WHITE}║  ${GREEN}[2]${NC} ✨ INSTALL - Unique Edition     ${WHITE}║${NC}"
    echo -e "${WHITE}║  ${BLUE}[x]${NC} ❌ KELUAR                       ${WHITE}║${NC}"
    echo -e "${WHITE}║                                          ║${NC}"
    echo -e "${WHITE}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -ne "${YELLOW}➤ Pilih menu [1/2/x]: ${NC}"
    read MENU
    
    case $MENU in
        1)
            uninstall_wallpaper
            echo ""
            echo -ne "${CYAN}Tekan Enter untuk kembali...${NC}"
            read
            ;;
        2)
            install_wallpaper
            echo ""
            echo -ne "${CYAN}Tekan Enter untuk kembali...${NC}"
            read
            ;;
        x)
            echo -e "\n${GREEN}✨ Thanks for using Rendzz Unique Edition!${NC}"
            echo -e "${CYAN}📱 Telegram: @lynnn046${NC}\n"
            exit 0
            ;;
        *)
            echo -e "${RED}Pilihan tidak valid!${NC}"
            sleep 1
            ;;
    esac
done

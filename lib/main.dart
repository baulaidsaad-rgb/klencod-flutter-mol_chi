<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="theme-color" content="#0f172a">
    <title>تطبيق سعد الأسطورة - تحدي التربية الإسلامية</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;800;900&display=swap');

        :root {
            --bg-dark: #0f172a;
            --card-bg: #1e293b;
            --card-border: #334155;
            --primary: #10b981;
            --primary-hover: #059669;
            --accent: #f59e0b;
            --accent-glow: rgba(245, 158, 11, 0.35);
            --danger: #ef4444;
            --info: #3b82f6;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Cairo', sans-serif;
            -webkit-tap-highlight-color: transparent;
        }

        body {
            background: radial-gradient(circle at top, #1e293b 0%, #0f172a 100%);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
        }

        /* شريط التطبيق العلوي الدائم */
        .app-navbar {
            width: 100%;
            background: rgba(15, 23, 42, 0.92);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(245, 158, 11, 0.35);
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.45);
        }

        .brand-logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .brand-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #f59e0b, #d97706);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
            box-shadow: 0 0 15px var(--accent-glow);
        }

        .brand-title {
            font-size: 1.25rem;
            font-weight: 900;
            background: linear-gradient(to left, #fbbf24, #f59e0b, #fde68a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: 0.5px;
        }

        .brand-badge {
            background: rgba(16, 185, 129, 0.15);
            color: var(--primary);
            border: 1px solid rgba(16, 185, 129, 0.35);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 800;
        }

        .container {
            width: 100%;
            max-width: 780px;
            padding: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* الواجهة الرئيسية */
        .hero-card {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 26px;
            padding: 32px 24px;
            text-align: center;
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.45);
            position: relative;
            overflow: hidden;
        }

        .hero-card::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(245, 158, 11, 0.1) 0%, transparent 60%);
            pointer-events: none;
        }

        .legend-crown {
            font-size: 3.6rem;
            margin-bottom: 8px;
            display: inline-block;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-8px); }
        }

        .app-main-title {
            font-size: 2.4rem;
            font-weight: 900;
            background: linear-gradient(135deg, #fde68a 0%, #f59e0b 50%, #d97706 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 8px;
            text-shadow: 0 4px 20px rgba(245, 158, 11, 0.25);
        }

        .phone-banner {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            background: rgba(15, 23, 42, 0.85);
            border: 1px solid rgba(245, 158, 11, 0.4);
            color: #fde68a;
            padding: 8px 18px;
            border-radius: 50px;
            font-size: 0.98rem;
            font-weight: 800;
            margin-bottom: 14px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .phone-banner a {
            color: #10b981;
            text-decoration: none;
            direction: ltr;
            font-weight: 900;
            letter-spacing: 0.5px;
        }

        .app-subtitle {
            color: var(--text-muted);
            font-size: 1.05rem;
            margin-bottom: 24px;
        }

        /* اختيار مستوى الصعوبة */
        .mode-selector {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin-bottom: 24px;
        }

        .mode-btn {
            background: rgba(15, 23, 42, 0.75);
            border: 2px solid var(--card-border);
            border-radius: 18px;
            padding: 15px;
            color: var(--text-main);
            cursor: pointer;
            transition: all 0.25s ease;
            text-align: center;
        }

        .mode-btn.active {
            border-color: var(--accent);
            background: rgba(245, 158, 11, 0.14);
            box-shadow: 0 0 22px rgba(245, 158, 11, 0.25);
        }

        .mode-btn h4 {
            font-size: 1.02rem;
            margin-bottom: 4px;
            color: #fbbf24;
        }

        .mode-btn p {
            font-size: 0.82rem;
            color: var(--text-muted);
        }

        /* قائمة الدروس */
        .topics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 12px;
            margin-bottom: 10px;
        }

        .topic-btn {
            background: #0f172a;
            border: 1px solid var(--card-border);
            border-radius: 16px;
            padding: 16px;
            color: var(--text-main);
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 6px;
        }

        .topic-btn:hover {
            transform: translateY(-3px);
            border-color: var(--primary);
            background: rgba(16, 185, 129, 0.1);
        }

        .topic-btn.all-topics {
            grid-column: 1 / -1;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            border: none;
            font-weight: 800;
            font-size: 1.15rem;
            padding: 18px;
            box-shadow: 0 10px 25px rgba(16, 185, 129, 0.35);
        }

        .topic-btn.all-topics:hover {
            transform: translateY(-3px);
            filter: brightness(1.08);
        }

        .topic-count {
            font-size: 0.78rem;
            background: rgba(255, 255, 255, 0.12);
            padding: 2px 10px;
            border-radius: 12px;
        }

        /* شاشة اللعب */
        .game-screen {
            display: none;
        }

        .stats-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            padding: 12px 18px;
            border-radius: 16px;
            margin-bottom: 16px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .stat-item {
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: 700;
            font-size: 0.95rem;
        }

        .progress-container {
            width: 100%;
            height: 9px;
            background: #0f172a;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 18px;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            width: 0%;
            transition: width 0.4s ease;
        }

        .question-card {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 22px;
            padding: 26px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.35);
            margin-bottom: 18px;
        }

        .topic-tag {
            display: inline-block;
            background: rgba(59, 130, 246, 0.15);
            color: #60a5fa;
            border: 1px solid rgba(59, 130, 246, 0.3);
            padding: 4px 14px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 700;
            margin-bottom: 14px;
        }

        .step-badge {
            display: inline-block;
            background: rgba(245, 158, 11, 0.15);
            color: #fbbf24;
            border: 1px solid rgba(245, 158, 11, 0.35);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.82rem;
            font-weight: 700;
            margin-right: 8px;
        }

        .situation-text {
            font-size: 1.25rem;
            font-weight: 700;
            line-height: 1.75;
            color: #ffffff;
            margin-bottom: 22px;
            background: rgba(15, 23, 42, 0.65);
            padding: 18px;
            border-radius: 16px;
            border-right: 4px solid var(--accent);
        }

        .options-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .options-grid.single-col {
            grid-template-columns: 1fr;
        }

        .option-btn {
            background: #0f172a;
            border: 2px solid var(--card-border);
            color: var(--text-main);
            padding: 16px;
            border-radius: 14px;
            font-size: 1.05rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            text-align: center;
            line-height: 1.5;
        }

        .options-grid.single-col .option-btn {
            text-align: right;
            font-size: 0.98rem;
            padding: 14px 18px;
        }

        .option-btn:hover:not(:disabled) {
            border-color: var(--accent);
            background: rgba(245, 158, 11, 0.1);
            transform: translateY(-2px);
        }

        .option-btn.correct {
            background: rgba(16, 185, 129, 0.22) !important;
            border-color: var(--primary) !important;
            color: #6ee7b7 !important;
        }

        .option-btn.wrong {
            background: rgba(239, 68, 68, 0.22) !important;
            border-color: var(--danger) !important;
            color: #fca5a5 !important;
        }

        .option-btn:disabled {
            cursor: not-allowed;
            opacity: 0.88;
        }

        /* صندوق التعليل والتغذية الراجعة */
        .feedback-box {
            display: none;
            margin-top: 20px;
            padding: 18px;
            border-radius: 16px;
            background: rgba(15, 23, 42, 0.88);
            border: 1px solid var(--card-border);
            animation: slideUp 0.3s ease;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .feedback-title {
            font-size: 1.1rem;
            font-weight: 800;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .feedback-rationale {
            color: #e2e8f0;
            font-size: 0.98rem;
            line-height: 1.65;
            background: rgba(255, 255, 255, 0.04);
            padding: 12px 14px;
            border-radius: 12px;
            margin-bottom: 14px;
        }

        .next-btn {
            width: 100%;
            background: linear-gradient(135deg, var(--primary), var(--primary-hover));
            color: white;
            border: none;
            padding: 14px;
            border-radius: 14px;
            font-size: 1.05rem;
            font-weight: 800;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .next-btn:hover {
            transform: scale(1.01);
        }

        /* شاشة النهاية */
        .result-screen {
            display: none;
            text-align: center;
        }

        .score-circle {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(245, 158, 11, 0.2), rgba(16, 185, 129, 0.2));
            border: 4px solid var(--accent);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            box-shadow: 0 0 30px var(--accent-glow);
        }

        .score-number {
            font-size: 2.2rem;
            font-weight: 900;
            color: #fbbf24;
        }

        .mistakes-list {
            text-align: right;
            margin-top: 20px;
            max-height: 300px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .mistake-item {
            background: #0f172a;
            border: 1px solid rgba(239, 68, 68, 0.3);
            padding: 14px;
            border-radius: 14px;
            font-size: 0.9rem;
        }

        /* التذييل السفلي في آخر التصفح */
        .app-footer {
            text-align: center;
            padding: 20px 16px;
            color: var(--text-muted);
            font-size: 0.9rem;
            background: rgba(15, 23, 42, 0.95);
            border-top: 1px solid rgba(245, 158, 11, 0.25);
            width: 100%;
            margin-top: auto;
            display: flex;
            flex-direction: column;
            gap: 8px;
            align-items: center;
        }

        .footer-phone {
            color: #e2e8f0;
            font-weight: 700;
            font-size: 0.95rem;
        }

        .footer-phone span {
            color: #10b981;
            font-weight: 900;
            direction: ltr;
            display: inline-block;
        }

        .footer-slogan {
            background: linear-gradient(135deg, rgba(245, 158, 11, 0.18), rgba(16, 185, 129, 0.18));
            border: 1px solid rgba(245, 158, 11, 0.45);
            color: #fde68a;
            padding: 8px 22px;
            border-radius: 14px;
            font-size: 1.08rem;
            font-weight: 900;
            letter-spacing: 0.3px;
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.15);
        }

        .footer-rights {
            color: #cbd5e1;
            font-size: 0.9rem;
            font-weight: 800;
            margin-top: 4px;
        }
        
        .footer-insta {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
            color: #ffffff;
            text-decoration: none;
            padding: 8px 20px;
            border-radius: 50px;
            font-size: 0.92rem;
            font-weight: 800;
            margin-top: 4px;
            box-shadow: 0 4px 15px rgba(220, 39, 67, 0.35);
            transition: transform 0.2s ease, filter 0.2s ease;
        }
        .footer-insta:hover {
            transform: translateY(-2px);
            filter: brightness(1.08);
        }

        @media (max-width: 540px) {
            .options-grid { grid-template-columns: 1fr; }
            .mode-selector { grid-template-columns: 1fr; }
            .app-main-title { font-size: 1.85rem; }
            .situation-text { font-size: 1.1rem; }
        }
    </style>
</head>
<body>

    <!-- شريط التطبيق العلوي الثابت -->
    <header class="app-navbar">
        <div class="brand-logo">
            <div class="brand-icon">👑</div>
            <div>
                <div class="brand-title">تطبيق سعد الأسطورة</div>
            </div>
        </div>
        <div class="brand-badge">التربية الإسلامية</div>
    </header>

    <main class="container">
        <!-- الواجهة الرئيسية -->
        <section id="startScreen" class="hero-card">
            <div class="legend-crown">🏆</div>
            <h1 class="app-main-title">تطبيق سعد الأسطورة</h1>
            
            <div class="phone-banner">
                <span>📞 رقم هاتف سعد الأسطورة:</span>
                <a href="tel:0633803259">0633803259</a>
            </div>

            <p class="app-subtitle">التحدي التفاعلي الشامل لجميع وضعيات وتعليلات التربية الإسلامية</p>

            <div class="mode-selector">
                <div class="mode-btn active" id="modeHard" onclick="setGameMode('hard')">
                    <h4>🔥 وضع الأسطورة (حكم + تعليل)</h4>
                    <p>حدد الحكم الشرعي ثم اختر التعليل الصحيح</p>
                </div>
                <div class="mode-btn" id="modeNormal" onclick="setGameMode('normal')">
                    <h4>⚡ الوضع السريع (الحكم فقط)</h4>
                    <p>اختبر سرعتك في تحديد الحكم الشرعي</p>
                </div>
            </div>

            <div class="topics-grid" id="topicsContainer">
                <!-- يتم توليد الأزرار تلقائياً -->
            </div>
        </section>

        <!-- شاشة اللعب -->
        <section id="gameScreen" class="game-screen">
            <div class="stats-bar">
                <div class="stat-item">👑 <span>سعد الأسطورة</span></div>
                <div class="stat-item">⭐ النقاط: <span id="scoreVal" style="color:#fbbf24">0</span></div>
                <div class="stat-item">🔥 سلسلة: <span id="streakVal" style="color:#10b981">0</span></div>
                <div class="stat-item">📋 <span id="qCounter">1/35</span></div>
                <button onclick="goHome()" style="background:rgba(239,68,68,0.15); color:#fca5a5; border:1px solid rgba(239,68,68,0.3); padding:4px 10px; border-radius:10px; cursor:pointer; font-weight:700;">خروج</button>
            </div>

            <div class="progress-container">
                <div class="progress-fill" id="progressBar"></div>
            </div>

            <div class="question-card">
                <div>
                    <span class="topic-tag" id="qTopic">مدخل الزواج</span>
                    <span class="step-badge" id="stepBadge">المرحلة 1: حدد الحكم المناسب</span>
                </div>

                <div class="situation-text" id="qText">نص الوضعية هنا...</div>

                <div class="options-grid" id="optionsContainer"></div>

                <div class="feedback-box" id="feedbackBox">
                    <div class="feedback-title" id="feedbackTitle"></div>
                    <div class="feedback-rationale" id="feedbackRationale"></div>
                    <button class="next-btn" id="nextBtn" onclick="nextQuestion()">السؤال التالي ⬅️</button>
                </div>
            </div>
        </section>

        <!-- شاشة النتيجة -->
        <sec 
       
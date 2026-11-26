# Leonard Sambu
**Security Researcher & Full-Stack Developer**

Kenya (UTC+3) · Open to remote work · Phone: +254 739 720 531 · Email: [cheruiyootsambu@gmail.com](mailto:cheruiyootsambu@gmail.com)
Portfolio: [llakterian.github.io](https://llakterian.github.io) · GitHub: [github.com/llakterian](https://github.com/llakterian) · LinkedIn: [linkedin.com/in/cheruiyoot-sambu](https://linkedin.com/in/cheruiyoot-sambu)
YouTube: [@tech_ale7](https://www.youtube.com/@tech_ale7) · TikTok: [@tech_ale](https://www.tiktok.com/@tech_ale) · X: [@llakterian](https://x.com/llakterian)

***

## Summary

I build web apps and test software for security holes before attackers find them. I've launched live apps used by farmers and businesses, reviewed the code of 20+ blockchain projects, and taken part in 60+ bug bounty programs. I also build the tooling that decides whether an AI agent is ready to ship: automatic checks, a separate reviewer model, and a baseline that never quietly moves down. I've led teams in media, education and tech, and I make tech and AI videos on YouTube ([@tech_ale7](https://www.youtube.com/@tech_ale7)) and TikTok ([@tech_ale](https://www.tiktok.com/@tech_ale)).

***

## Skills

| Area | What I do | Tools |
|---|---|---|
| **Building apps** | I build full websites and apps, from screen to database, and launch them live. | React, TypeScript, JavaScript, Node.js, Python, Flutter, REST APIs |
| **Security testing** | I test websites and code for security holes and write clear reports on how to fix them. | OWASP Top 10, penetration testing, code review, digital forensics, Nuclei |
| **Blockchain** | I write and review smart contracts for payments, escrow and tokens. | Solidity, Foundry, Hardhat, Slither |
| **AI features** | I add AI to real products (assistants, content sorting, advice tools) and keep it safe and reliable, with automatic checks, an AI reviewer and a quality gate. | Claude, Gemini, Groq, MCP, LLM evals |
| **Cloud & launch** | I put apps online, keep them fast, and automate testing and releases. | Cloudflare, Docker, Supabase, Git, CI/CD |
| **Leading people** | I run teams and projects, plan the work and keep clients updated. | Agile/Scrum, Jira, Trello |
| **Video & media** | I edit video, direct live broadcasts and make AI video content. | DaVinci Resolve, OBS Studio |

***

## Experience

### Technology Consultant & Developer | Self-employed | Sep 2023 to Present
- Built and launched live business apps for Kenyan farms and dairy co-operatives (Maziwa Coop, Sambu Farm Manager), with secure logins and role-based access.
- Rescued a client's hacked WordPress sites: removed a hidden backdoor and 8 fake admin accounts, and cut page load time from 30+ seconds to about 1 second.
- Built a system that sends Facebook and Instagram ad leads straight into the client's CRM, with no duplicates and a 90-day history.
- Wrote and security-tested smart contracts for client payment and escrow systems.

### Security Researcher & Bug Bounty Hunter | Independent | 2024 to Present
- Reviewed the code of 20+ blockchain projects (DeFi, stablecoins, bridges, lending) and took part in 40+ website bug bounty programs on HackenProof, Cantina, Bugcrowd, Intigriti and Immunefi.
- Had findings accepted at every severity level, including bugs that put user funds at risk, a critical leak of personal data in a company dashboard, and a flaw that let one customer change another's records. Client names stay private under disclosure agreements.
- Back every report with working proof: automated tests on a copy of the live blockchain, or step-by-step reproductions for websites.
- Use AI agents to speed up code reviews, then check every finding by hand before reporting it.

### Tech & AI Video Creator | YouTube & TikTok | Ongoing
- Make tech explainers, AI-generated videos and blockchain-security tips on YouTube ([@tech_ale7](https://www.youtube.com/@tech_ale7)) and TikTok ([@tech_ale](https://www.tiktok.com/@tech_ale)), handling scripting, editing and sound myself.

### Project Manager | SIZLAND Limited | Nov 2025 to Mar 2026
- Ran sprint planning, daily stand-ups and reviews for a blockchain development team using Jira and Trello.
- Delivered a 39,000-line AI content platform and a land-escrow system, with full handover documentation.
- Acted as the main link between developers, management and outside partners.

### Game Developer (Charity Project) | Jampack Incubator | Feb 2026
- Built Mathlantis, a maths puzzle game for children, for Games for Love. Awarded "Most Child Friendly Game".

### Director & Manager | Sambu Academy | Aug 2022 to Present
- Lead a team of teachers; introduced clear daily routines that raised productivity by about 30%.

### Technical Director & Firm Manager | KASS Media | Feb 2019 to Apr 2023
- Directed live TV broadcasts and studio production: cameras, sound, graphics, multi-camera switching and editing.
- Managed technical budgets, equipment buying and suppliers for daily news, entertainment and live events; also ran logistics and building projects for the studios (2019 to 2022).
- Trained junior staff and set up equipment maintenance routines that cut downtime by 40%.

**Earlier roles:** Passenger Handling Agent, Swissport Kenya (2011) · Public Relations Attaché, KEMSA (2011)

***

## Key Projects

> More projects, screenshots and details at [llakterian.github.io](https://llakterian.github.io/#projects)

**fluxharness: eval harness for AI agents** · [github.com/llakterian/flux](https://github.com/llakterian/flux)
Open-source mini eval harness: three agents pass typed, checked results to each other, ten deterministic guardrails score first, a separate larger model judges composition and taste, and a saved baseline turns "it worked once" into a regression check. 31 tests; a deliberately weakened copy of the workflow scores 0.000.
*Python, NVIDIA NIM, pytest, OpenAI-compatible API*

**Sambu Farm Manager: farm management app** · [sambufarm-demo.pages.dev](https://sambufarm-demo.pages.dev)
Replaced a tea estate's paper payroll book (20 to 30 workers, 12 to 39 tonnes of tea a month). Works out piece-rate, daily and monthly pay in one place, plans livestock feed using official Kenyan nutrition tables, tracks expenses and works offline.
*React, Hono, Cloudflare Workers + D1, installable web app*

**Maziwa Coop: dairy co-operative app** · [maziwa-coop.pages.dev](https://maziwa-coop.pages.dev)
Replaced paper milk records for dairy co-operatives. Logs daily deliveries, texts each farmer a confirmation by SMS, tracks credit and produces month-end reports.
*React, Hono, Cloudflare D1, Africa's Talking SMS*

**Shambani: weather & farming advice** · [shambani-app.pages.dev](https://shambani-app.pages.dev)
Weather for all 47 Kenyan counties with 7-day forecasts, plus AI farming advice based on official Kenyan agricultural guidelines.
*FastAPI, Cloudflare, Groq AI, Open-Meteo*

**Uplift: good-news app** · [uplift.llakterian.workers.dev](https://uplift.llakterian.workers.dev)
Shows only positive stories, pulled from Reddit, Hacker News, Mastodon and RSS feeds and sorted by AI in English and Swahili. Installs like a phone app, works offline, sends push notifications and has a Telegram bot. Security built in: safe password storage, protected logins, rate limiting and a locked-down image proxy.
*React, TypeScript, Cloudflare Workers, D1, KV, Groq AI*

**SafeShamba: safer land buying** · [safeshamba.us.ci](https://safeshamba.us.ci)
Holds a land buyer's money in a smart contract and only releases it after a notary and due-diligence checks approve each step.
*Solidity (tested with Foundry and Slither), React, Cloudflare*

**QuitVaping: quit-vaping coach** · [quitvaping.netlify.app](https://quitvaping.netlify.app)
Helps people quit vaping: tracks progress, money saved and health recovery, with an AI coach and a guided breathing mode for cravings.
*Flutter, Supabase*

**c0bw3b Toolkit: my own security scanner**
13,000 lines of Python that automatically maps a website and checks it for common security holes, then filters out false alarms. 107 automated tests.
*Python, Nuclei*

***

## Certifications

- Smart Contract Security; Solidity Smart Contract Development; Full Stack Web3 Development, Cyfrin Updraft, 2024
- Generative AI Literacy (scored 92%), Simplilearn SkillUP, 2026
- CompTIA Cloud+ (CV0-003) Specialization, Coursera, in progress
- Digital Forensics Masterclass (DFMC+), Udemy, 2024
- Cybersecurity Awareness and Innovation, EIT Digital / Coursera, 2024
- Insider Threat Awareness; Establishing an Insider Threat Program; Cybersecurity Awareness, US DCSA / CDSE, 2022 to 2024
- Ethereum Blockchain Programming, CryptoZombies, 2022

Full list with certificates: [llakterian.github.io](https://llakterian.github.io/#certifications)

***

## Education

| Qualification | Institution | Year |
|---|---|---|
| **B.A. International Relations & Diplomacy with I.T.** (studies paused) | Maseno University | from 2008 |
| **Certificate in HTML** | Star College | 2008 |
| **Kenya Certificate of Secondary Education** | Milimani High School | 2007 |

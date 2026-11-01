document.addEventListener('DOMContentLoaded', () => {
    // Scroll Reveal Animation — for .specimen-section elements
    const revealElements = document.querySelectorAll('.specimen-section, .reveal');
    const revealOptions = {
        threshold: 0.05,
        rootMargin: "0px 0px -30px 0px"
    };

    const revealObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, revealOptions);

    revealElements.forEach(el => revealObserver.observe(el));

    // Ensure all sections are visible even if observer doesn't fire
    // (fallback for above-the-fold content)
    setTimeout(() => {
        revealElements.forEach(el => {
            if (!el.classList.contains('visible')) {
                el.classList.add('visible');
            }
        });
    }, 100);

    // Stat Cards count-up
    const statValues = document.querySelectorAll('.stat-value[data-target]');
    const statObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting && !entry.target.dataset.animated) {
                entry.target.dataset.animated = 'true';
                const el = entry.target;
                const target = parseInt(el.dataset.target, 10);
                const duration = 1200;
                const startTime = performance.now();
                const step = (now) => {
                    const progress = Math.min((now - startTime) / duration, 1);
                    const ease = 1 - Math.pow(1 - progress, 3);
                    const val = Math.floor(ease * target);
                    el.textContent = val.toLocaleString();
                    if (progress < 1) requestAnimationFrame(step);
                    else el.textContent = target.toLocaleString();
                };
                requestAnimationFrame(step);
                statObserver.unobserve(el);
            }
        });
    }, { threshold: 0.4 });
    statValues.forEach(v => statObserver.observe(v));

    // Spotlight hover effect
    document.querySelectorAll('.stat-card, .tilt-card, .finding-card, .audit-card, .project-card, .contact-card').forEach(card => {
        card.addEventListener('pointermove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            card.style.setProperty('--mx', `${x}px`);
            card.style.setProperty('--my', `${y}px`);
        });
    });

    // Bouncy Accordion toggle
    document.querySelectorAll('.bouncy-accordion').forEach(acc => {
        const trigger = acc.querySelector('.cert-trigger, .finding-header');
        if (trigger) {
            trigger.addEventListener('click', (e) => {
                e.preventDefault();
                acc.toggleAttribute('open');
                trigger.setAttribute('aria-expanded', acc.hasAttribute('open') ? 'true' : 'false');
            });
        }
    });

    // Active section highlighting in index
    const indexLinks = document.querySelectorAll('.specimen-index a');
    const sections = document.querySelectorAll('.specimen-section');
    if (indexLinks.length > 0) {
        window.addEventListener('scroll', () => {
            let current = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                if (window.scrollY >= (sectionTop - 200)) {
                    current = section.getAttribute('id');
                }
            });
            indexLinks.forEach(a => {
                a.classList.remove('active');
                if (a.getAttribute('href') === `#${current}`) {
                    a.classList.add('active');
                }
            });
        });
    }
});

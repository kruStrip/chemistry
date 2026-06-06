# Current Design System (v0.1)

## 1. Brand and Tone
Текущий UI визуально тяготеет к тёмной sci‑fi/tech эстетике: глубокий тёмный фон, яркие неоновые акценты (cyan/pink/violet), стеклянные панели и свечение. Типографика в целом современная и контрастная (Onest + жирные заголовки), с большим разбросом размеров между hero, контентом и служебными блоками. Лейаут преимущественно карточный, с округлениями и мягкими blur/gradient-слоями.

## 2. Color Tokens

### 2.1 Palette

| Token | Value | Usage examples |
| --- | --- | --- |
| `color.bg.base` | `#030210` | Базовый фон приложения (`:root --bg`) |
| `color.bg.deep` | `#070519` | Доп. тёмный фон (`--bg-deep`) |
| `color.bg.panel` | `rgba(0, 0, 0, 0.42)` | Основные карточки (`.card`) |
| `color.bg.panelSoft` | `rgba(14, 12, 26, 0.35)` | Мягкие панели (`--panel-soft`) |
| `color.bg.overlay.topbar` | `rgba(3, 2, 16, 0.88)` | Фиксированный header (`.topbar`) |
| `color.bg.footer` | `rgba(4, 4, 24, 0.78)` | Footer (`.site-footer`) |
| `color.bg.input` | `rgba(8, 7, 25, 0.55)` | Базовые input/select/textarea |
| `color.bg.input.select` | `#080719` | `select` в `.field` |
| `color.text.base` | `#ffffff` | Основной текст |
| `color.text.muted` | `#a9a6c7` | Вторичный текст (`--muted`) |
| `color.text.onLight` | `#050418` | Текст на светлой secondary кнопке |
| `color.primary` | `#2fe3e1` | Главный акцент (`--cyan`) |
| `color.primary.rgb` | `47, 227, 225` | RGB-база для glow/прозрачностей |
| `color.accent.pink` | `#e0334a` | Danger / badge (`--pink`) |
| `color.accent.violet` | `#2e22a3` | Градиенты/акценты (`--violet`) |
| `color.border.accent` | `rgba(47, 227, 225, 0.28)` | Рамки карточек (`--line`) |
| `color.link.base` | `#ffffff` | Inline links и текстовые ссылки |
| `color.feedback.error` | `#f87171` | Ошибки в lead-форме |
| `color.gradient.cta` | `linear-gradient(135deg, #10c8e8 0%, #3a8adf 32%, #6540c4 62%, #dc3a62 100%)` | Primary CTA (`--cta-gradient`) |
| `color.gradient.ctaHover` | `linear-gradient(135deg, #2ad8f0 0%, #52a0ff 30%, #7a58d8 58%, #f05078 100%)` | Hover primary CTA |

### 2.2 Semantic Mapping
Фоны: `color.bg.base` используется как глобальный фон, `color.bg.panel`/`color.bg.panelSoft` — для карточек и контент-блоков, `color.bg.overlay.topbar`/`color.bg.footer` — для крупных chrome-зон (header/footer).  
Текст: доминирует `color.text.base`; вторичный текст — `color.text.muted` и полупрозрачные белые оттенки (`rgba(..., 0.6-0.96)`).  
Бордеры: чаще всего используются полупрозрачные cyan/white (`color.border.accent`, `rgba(255,255,255,0.12-0.35)`).  
Акценты: `color.primary`, `color.accent.pink`, `color.accent.violet` и `color.gradient.cta`.  
Ссылки: базово белые подчёркнутые (`.inline-link`, `.auth-row a`), hover часто через text-shadow или cyan tint.  
Ошибки: явно заданы в `.state-error`, `.hp-lead-input--invalid`, `.hp-lead-field-error`; единого глобального error token для всех форм нет.

## 3. Typography

### 3.1 Base Typography
- `font.family.base`: `Onest, "Segoe UI", system-ui, -apple-system, BlinkMacSystemFont, sans-serif`
- Базовый размер шрифта на `body` явно не задан (фактически browser default, обычно `16px`)
- `line-height` по умолчанию не фиксируется глобально; чаще встречаются локальные `1.45`, `1.5`, `1.55`, `1.6`
- `color` по умолчанию: `var(--text)` = `#ffffff`

### 3.2 Headings
- `font.size.h1.hero`: `110px`, `weight 700`, `line-height 1.05` (`.hp-hero-copy h1`)
- `font.size.h1.page`: `38px`, `weight 500` (`.page-header h1`, auth card h1)
- `font.size.h1.kitHero`: `42px` (`.kit-landing-hero-copy h1`)
- `font.size.h1.legal`: `32px` (`.legal-article h1`)
- `font.size.h2.kit`: `30px` (`.kit-landing-card h2`, `.kit-landing-gallery h2`)
- `font.size.h2.legal`: `20px` (`.legal-article h2`)
- В иммерсивных/программных секциях есть дополнительные `h1/h2/h3` через `clamp(...)` и `font-variation-settings`
- Явных отдельных системных стилей для `h4-h6` не найдено

### 3.3 Other Text Styles
- `font.size.body.md`: `14px` (самый частый размер по проекту)
- `font.size.body.sm`: `12px` (подписи, meta, badges)
- `font.size.body.lg`: `15-18px` (часто в карточках/контенте)
- `font.size.caption`: `12-13px` (`.topbar-format-note`, `.site-footer-requisites`, `.legal-meta`)
- `font.size.link.inline`: у ссылок размер обычно наследуется от контейнера, но вес чаще `700`

## 4. Spacing and Layout

### 4.1 Spacing Scale

| Token | Value | Usage examples |
| --- | --- | --- |
| `space.xs` | `4px` | Мелкие отступы/маргины в подписях |
| `space.sm` | `8px` | Gap в компактных группах, checkbox-row |
| `space.md` | `12px` | Основной gap для row/controls/buttons |
| `space.lg` | `16px` | FAQ trigger padding, panel gaps |
| `space.xl` | `24px` | Карточки, grid gaps, section paddings |
| `space.2xl` | `32px` | Footer/page paddings, большие секции |
| `space.3xl` | `48px` | Вертикальные отступы страницы |
| `space.section.dynamic` | `clamp(48px, 6vw, 64px)` | Ритм крупных home-секций (`--hp-block-gap`) |

### 4.2 Section Layout
- Основной контейнер страницы: `.page` с `max-width: 1120px`, `padding: 48px clamp(18px, 5%, 48px) 96px`
- Home-контейнер: `.hp-inner` с `max-width: 1200px` и адаптивными горизонтальными отступами
- Topbar фиксированная, с внутренним ограничением через формулу `calc((100vw - 1036px) / 2)`
- Hero-блоки (`.hp-hero`, `.detail-hero--immersive`) используют full-width и адаптивные `clamp(...)` padding
- Footer: `.site-footer-inner` grid с адаптацией `2 columns -> 1 column` на узких экранах

## 5. Radii and Shadows

### 5.1 Border Radius
- `radius.pill`: `999px` (кнопки, nav links, badges)
- `radius.round`: `50%` (иконки/аватары)
- `radius.card`: `40px` (`.card`)
- `radius.input`: `37px` (input/select базовых форм)
- `radius.panel`: `24px` (`.state-box`, mobile-nav panel)
- `radius.control`: `16px` (FAQ trigger, custom select shell, payment fields)
- Дополнительно встречаются: `14px`, `12px`, `20px`, `28px`, `30px`, `32px`, `36px`, `56px`, `93px`, `0`
- **Inconsistency:** радиусы сильно фрагментированы (особенно между form/card/immersive секциями)

### 5.2 Shadows
- `shadow.base`: `0 24px 70px rgba(0, 0, 0, 0.36)` (`--shadow`, базовые card/auth card)
- `shadow.topbar`: `0 4px 26px rgba(0, 0, 0, 0.28)`
- `shadow.button.primary`: многослойный glow + depth (`inset`, `0 8px 24px ...`, `0 14px 36px ...`)
- `shadow.focus.cyan`: `0 0 0 1px rgba(var(--cyan-rgb), 0.5), 0 0 20px rgba(var(--cyan-rgb), 0.32)` (формы/select)
- `shadow.state.none`: много локальных `box-shadow: none` (override карточек в отдельных секциях)
- **Inconsistency:** вместо компактного набора используется много уникальных shadow-формул под конкретные секции

## 6. Components

### 6.1 Buttons
- **Base (`.button`)**  
  Токены: `radius.pill`, `font-weight 500`, `min-height 38px`, `padding 10px 18px`, transition-heavy.  
  Состояния: `hover` -> `translateY(-2px)`, `disabled` -> `opacity 0.58`, `cursor: not-allowed`.
- **Primary (`.button-primary`)**  
  Токены: `color.gradient.cta`, `color.text.base`, сильный glow-shadow, `font-weight 650`.  
  Состояния: `hover` (градиент hover + усиленный glow + scale), `active` (brightness down), `focus-visible` (белый outline), `disabled` наследуется от base.
- **Secondary (`.button-secondary`)**  
  Токены: `background rgba(255,255,255,0.96)`, `color.text.onLight`.  
  Состояния: глобально детально не описаны; есть локальные переопределения (например `#chem9-reviews`) с hover/focus/active.
- **Ghost (`.button-ghost`)**  
  Токены: transparent + `1.5px` белый бордер.  
  Состояния: в общем стиле ограничены; есть локальный полный набор в `.hp-reviews-more`.
- **Danger (`.button-danger`)**  
  Токены: `color.accent.pink`, белый текст.  
  Состояния: отдельных hover/focus/active правил в общей системе нет.
- **Notes on inconsistencies**  
  Primary имеет проработанные состояния, secondary/ghost/danger — неполные и часто зависят от контекста страницы.

### 6.2 Inputs and Form Elements
- **Base fields (`.field input/select/textarea`)**  
  Токены: `background rgba(8,7,25,0.55)`, `border 0.5px solid rgba(255,255,255,0.86)`, `radius.input`, `min-height 50px`, `padding 12px 22px`, placeholder `#a8a8a8`.
- **Textarea**  
  `border-radius: 24px`, `resize: vertical`.
- **Password field toggle**  
  Иконка-кнопка имеет `hover` и `focus-visible` состояния с cyan-акцентом.
- **Lead form variant (`.hp-lead-input`)**  
  Имеет полноценные `focus/focus-visible` и `invalid` (включая красный glow + текст ошибки).
- **Payment form variant**  
  Имеет отдельные `hover/focus/active` для инпутов и маски телефона (`radius: 16px`, cyan focus-ring).
- **Focus and error states**  
  Фокус/ошибки есть в отдельных зонах, но нет единого глобального правила для всех `.field` контролов.
- **Notes on missing states**  
  TODO: унифицированные global `:focus-visible`, `:disabled`, `:error` для всех базовых input/select/textarea отсутствуют.

### 6.3 Cards and Content Blocks
- **Base Card (`.card`)**  
  Структура: заголовок (`h2/h3`), текст (`p`), actions через дочерние кнопки/ссылки.  
  Токены: `color.bg.panel`, `color.border.accent`, `radius.card (40px)`, `shadow.base`, `padding 24px`.
- **State Box (`.state-box`)**  
  Токены: cyan-tinted фон/бордер, `radius 24px`, `padding 14px`; error variant (`.state-error`) в pink-red палитре.
- **Hero Card variants (`.detail-hero`, `.figma-auth-card`, kit cards)**  
  Используют отдельные радиусы/фон/тени (`56px`, `93px`, `32px`, `36px`, `background rgba(...)`), иногда отключают базовые card-атрибуты (`background none`, `box-shadow none`).
- **Usage examples**  
  Карточки встречаются в личном кабинете, оплате, каталоге, FAQ/лендингах, auth, reviews.

### 6.4 Navigation and Header/Footer
- **Header / Topbar**  
  Fixed top bar с blur и тёмным полупрозрачным фоном; nav links pill-формы, hover/active с cyan tint и свечением текста.
- **Desktop nav**  
  `font-size 14px`, `font-weight 500`, link padding `9px 12px`, состояния `hover`/`.active`.
- **Mobile nav**  
  Overlay + panel (`radius 24px`, blur, dark bg), burger имеет `hover` и `focus-visible` outline.
- **Footer**  
  Grid-структура из 3 логических колонок (контакты, разделы, legal links), карточные ссылки разделов (`radius 12px`) с hover lift/shift, social icons круглые с hover glow.

## 7. States and Interactions Overview
Hover: широко используется (кнопки, nav links, social icons, footer links, custom select options), часто с `translateY(...)` и glow.  
Focus: присутствует в части интерактивов (`.button-primary`, burger, password-toggle, reviews-select, payment fields, некоторые link-компоненты), но не везде системно.  
Active: есть у primary CTA, custom select options, отдельных кнопок в reviews/lead-блоках.  
Disabled: у базовых `.button` есть единая логика, у form-controls глобального системного disabled-оформления почти нет.  
Error: реализован в `.state-error` и отдельных формах (`hp-lead`), но нет общего error-паттерна для всех инпутов проекта.  
Loading: есть `state-loading` + orbital loader (статический и motion-вариант).

## 8. Known Issues and Inconsistencies
- Слишком много значений `border-radius` (от `0` до `93px`, включая `37/40/24/16/14/12/999`), единая шкала не соблюдается.
- Primary кнопка хорошо проработана по состояниям, secondary/ghost/danger — частично или только в локальных контекстах.
- Для `.field input/select/textarea` нет глобального унифицированного `:focus-visible`/`:error`; фокус-логика локально разная (lead/payment/reviews).
- Много уникальных box-shadow-гайдлайнов для отдельных блоков вместо компактного набора токенов.
- Встречаются дубли и контекстные переопределения одних и тех же компонентов (например кнопки и hero-элементы в разных секциях/медиабрейкпоинтах).
- Цветовая система в базе опирается на переменные, но параллельно используется большое число прямых `rgba/hex` значений.

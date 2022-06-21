
<HTML>
<head>
<style>
:root {
  --background: #ffffff;
  --cs-primary: #25b9f4;
  --cs-surface: #ffffff;
  --cs-surface-2: #eef4f8;
  --cs-separator: #e8ecf0;
  --cs-on-surface-primary: #000000;
  --cs-on-surface-secondary: #657786;
  --font-family-primary: "DM Sans", Aria, sans-serif;
  --joke-author-img-width: 60px;
  --joke-width: 480px;
  --layout-container-width: 920px;
}

* {
  box-sizing: border-box;
}

html,
body {
  background: var(--background);
  font-family: var(--font-family-primary);
  font-size: 14px;
  line-height: 1.42;
  height: 100%;
}

#root {
  height: 100%;
}

.joke {
  background-color: var(--cs-surface);
  padding: 15px;
  min-height: calc(33px + var(--joke-author-img-width));
  transition: background-color 0.25s;
}

.joke:focus,
.joke:hover {
  background-color: var(--cs-surface-2);
}

.joke_wrapper {
  margin-left: calc(1.25 * var(--joke-author-img-width));
}

.joke_block {
  position: relative;
}

.joke_block--header .joke_element {
  display: inline-block;
  margin-right: 7px;
}

.joke_element--author-img {
  height: var(--joke-author-img-width);
  left: calc(-1.25 * var(--joke-author-img-width));
  position: absolute;
  top: 3px;
  width: var(--joke-author-img-width);
}

.joke_element--author-img img {
  border-radius: 50%;
  max-width: 100%;
}

.joke_element--author-name {
  color: var(--cs-on-surface-primary);
  font-weight: bold;
}

.joke_element--author-username {
  color: var(--cs-on-surface-secondary);
}

.joke_element {
  margin: 0;
}

.joke_block--text {
  font-size: 18px;
  margin-top: 7px;
}

.joke_block--footer {
  margin-top: 12px;
}

.layout {
  height: 100%;
}

.layout_wrapper {
  display: grid;
  grid-template-columns: 140px 480px 1fr;
  height: 100%;
  margin: auto;
  width: var(--layout-container-width);
}

.layout_header {
  background-color: var(--cs-surface);
  height: 100%;
}

.layout_content {
  border-left: 1px solid var(--cs-separator);
  border-right: 1px solid var(--cs-separator);
  width: var(--joke-width);
}

.layout_footer {
  padding: 20px;
}

.feed_header {
  border-bottom: 1px solid var(--cs-separator);
  padding: 20px;
}

.feed {
  margin-bottom: 60px;
}

.feed_title {
  font-size: 20px;
  font-weight: bolder;
  margin: 0;
}

.feed_subtitle {
  color: var(--cs-on-surface-secondary);
  margin: 0;
  margin-top: 7px;
}

.feed_item {
  border-bottom: 1px solid var(--cs-separator);
}

.feed_error {
  padding: 40px;
  text-align: center;
}

.feed_error_icon {
  fill: hsla(197, 20%, 92%, 1);
  height: 90px;
  width: 90px;
}

.feed_error_title {
  color: var(--cs-on-surface-primary);
  font-weight: bold;
  margin: 0;
  margin-top: 1.3em;
}

.feed_error_text {
  color: var(--cs-on-surface-secondary);
  margin: 0;
  margin-top: 0.7em;
}

.navbar--header {
  background-color: #ffffff;
  /*box-shadow: 0 5px 30px hsla(197 , 75%, 55%, .08);*/
  position: relative;
}

.navbar_block {
  padding: 8px;
}

.navbar_header {
  display: flex;
  justify-content: flex-end;
}

.navbar_brand {
  display: block;
  padding: 20px 20px;
}

.navbar_brand svg {
  display: block;
  fill: var(--cs-primary);
  height: 34px;
  width: 34px;
}

.form--search-form input {
  -webkit-appearance: none;
  background-color: #e8ecf0;
  border: 2px solid #e8ecf0;
  border-radius: 25px;
  font-size: 12px;
  line-height: 1;
  outline: none;
  padding: 8px 12px;
  width: 100%;
}

.form--search-form input::placeholder {
  font-style: italic;
}

.form--search-form input:focus {
  border: 2px solid var(--cs-primary);
}

.nav {
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav--joke_rebound .nav_item {
  display: inline-block;
  margin-right: 70px;
}

.nav--joke_rebound .nav_link svg {
  display: block;
  fill: var(--cs-on-surface-secondary);
  height: 20px;
  margin-right: 5px;
  width: 20px;
}

.nav--joke_rebound .nav_link {
  align-items: center;
  color: var(--cs-on-surface-secondary);
  display: flex;
  text-decoration: none;
}

.nav--joke_rebound .nav_link:hover {
  color: var(--cs-primary);
}

.nav--joke_rebound .nav_link:hover svg {
  fill: var(--cs-primary);
}

.pagination--infinite-scroll .pagination_button_next {
  background-color: #ffffff;
  border-color: transparent;
  color: var(--cs-primary);
  cursor: pointer;
  letter-spacing: 0.045em;
  padding: 20px;
  width: 100%;
}

.section {
  background-color: var(--cs-surface-2);
  border-radius: 10px;
  margin-bottom: 20px;
}

.section--search {
  background-color: #ffffff;
}

.section_block {
  padding: 15px;
}

.section_block--header {
  border-bottom: 1px solid var(--cs-separator);
}

.section_block--content p {
  margin: 0;
  margin-bottom: 1em;
}

.section_title {
  margin: 0;
}

.nav_item + .nav_item {
  margin-top: 10px;
}

.nav_link {
  color: var(--cs-on-surface-primary);
  text-decoration: none;
}

.nav_link_text--primary {
  color: var(--cs-on-surface-primary);
  display: block;
  font-weight: bold;
  font-size: 16px;
}

.nav_link_text--secondary {
  color: var(--cs-on-surface-secondary);
}

</style>
</head>
<body>
<div id="root"></div>

<script src="https://unpkg.com/preact@8.4.2/dist/preact.min.js"></script>
<script src="https://unpkg.com/prop-types@15.5.8/prop-types.min.js"></script>
<script src="https://unpkg.com/preact-compat@3.17.0/dist/preact-compat.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.14/lodash.min.js"></script>
<script>
  // 😔 react-router is compatible without compat only for alpha and beta release;
  // ->  from react-router@v4.0.0-beta.5 preact-compat is needed
  // 😔 with latest version of preact-compat v3.19.0, createContext triggers an error;
  // -> v3.17.0 and earlier are working fine.
  var React = preactCompat,
    ReactDOM = preactCompat;
</script>
<script src="https://unpkg.com/react-router-dom@5.0.1/umd/react-router-dom.js"></script>
</body>
</html>
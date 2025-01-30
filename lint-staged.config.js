/** @type {import("lint-staged").Config} */
export default {
  "package.json": "yarn prettier-package-json --write",
  "*.{css,html,js,json,md,sh,ts,yml}": "prettier --write",
};

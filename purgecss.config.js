module.exports = {
    // These are the files that Purgecss will search through
    content: ["./_site/**/*.html"],

    // These are the stylesheets that will be subjected to the purge
    css: ["./_site/assets/css/styles.css"],

    // These classes and ids will not be purged
    whitelist: ["show", "collapsing"]
};

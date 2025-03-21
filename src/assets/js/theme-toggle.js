(function () {
  const TRANSLATIONS = {
    ca: {
      dark: "Mode fosc",
      light: "Mode clar",
    },
  };

  function getLocalizedText(mode) {
    const lang = document.documentElement.lang || "en";
    const translations = TRANSLATIONS[lang] || TRANSLATIONS["en"];
    return translations[mode];
  }

  function setTheme(preference) {
    if (!document.body) return;

    // Update HTML attribute for theme
    document.documentElement.setAttribute("data-theme", preference);
    document.body.classList.remove("theme-dark", "theme-light");
    document.body.classList.add(`theme-${preference}`);

    // Update button aria-label and title
    const toggleLabel = document.querySelector(".theme-toggle");
    const toggle = document.querySelector("#theme-toggle");

    if (toggleLabel) {
      toggleLabel.setAttribute("aria-label", preference);
      const nextMode = preference === "dark" ? "light" : "dark";
      toggleLabel.setAttribute("title", getLocalizedText(nextMode));
    }

    // Set checkbox state - checked for dark theme, unchecked for light theme
    if (toggle) {
      toggle.checked = preference === "dark";
    }

    // Save preference
    localStorage.setItem("theme", preference);
  }

  function initializeTheme() {
    // Get saved preference or system preference
    const savedTheme = localStorage.getItem("theme");
    const systemPreference = window.matchMedia("(prefers-color-scheme: light)").matches ? "light" : "dark";
    const initialTheme = savedTheme || systemPreference;

    // Initialize theme
    setTheme(initialTheme);

    // Add click handler
    const toggle = document.querySelector("#theme-toggle");
    if (toggle) {
      toggle.addEventListener("click", () => {
        // Use the checkbox's checked state to determine the new theme
        const newPreference = toggle.checked ? "dark" : "light";
        setTheme(newPreference);
      });
    }
  }

  // Initialize when DOM is ready
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initializeTheme);
  } else {
    initializeTheme();
  }

  // Sync with system changes
  window.matchMedia("(prefers-color-scheme: dark)").addEventListener("change", ({ matches: isDark }) => {
    setTheme(isDark ? "dark" : "light");
  });
})();

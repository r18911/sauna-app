document.addEventListener("turbo:load", function () {
  const menuToggle = document.getElementById("navbarDropdown");
  const menuDropdown = document.getElementById("menuDropdown");

  // ページ読み込み時にドロップダウンを確実に閉じる
  menuDropdown.classList.remove("show");

  menuToggle.addEventListener("click", function (event) {
    event.preventDefault();
    event.stopPropagation();

    // すべての他のドロップダウンを閉じる
    document.querySelectorAll(".dropdown-menu").forEach(menu => {
      if (menu !== menuDropdown) {
        menu.classList.remove("show");
      }
    });

    // メニューをトグル
    menuDropdown.classList.toggle("show");
  });

  document.addEventListener("click", function (event) {
    if (!menuDropdown.contains(event.target) && !menuToggle.contains(event.target)) {
      menuDropdown.classList.remove("show");
    }
  });
});
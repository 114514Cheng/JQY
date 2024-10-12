var loginBtn = document.getElementById('loginBtn');

  // 获取登录框元素
  var loginModal = document.getElementById('loginModal');

  // 获取关闭按钮元素
  var closeBtn = document.getElementsByClassName('close')[0];

  // 点击登录按钮时显示登录框
  loginBtn.onclick = function() {
    loginModal.style.display = "block";
  }

  // 点击关闭按钮时隐藏登录框
  closeBtn.onclick = function() {
    loginModal.style.display = "none";
  }

  // 点击模态框外部时隐藏登录框
 /**
 * 
 */
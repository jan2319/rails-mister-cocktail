import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Professionally Tailored Cocktails", "Munich Mule", "Gin Fizz", "Harvey Wallbanger", "Caipirinha", "Bahama Mama"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };

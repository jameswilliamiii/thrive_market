$(document)
  .foundation({
    abide : {
      patterns: {
        phone: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
      }
    }
  });
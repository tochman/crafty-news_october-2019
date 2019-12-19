// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


document.addEventListener('turbolinks:load', () => {
  let stripeForm = document.getElementById('subscription_form')

  if (stripeForm) {
    console.warn('hello')
    const stripe = Stripe('pk_test_QicERB8w3kyqaYW3hUUQylRH')
    const elements = stripe.elements()
    let cardNumber = elements.create('cardNumber')
    let cardExpiry = elements.create('cardExpiry')
    let cardCvc = elements.create('cardCvc')

    cardNumber.mount('#card-number')
    cardExpiry.mount('#card-expiry')
    cardCvc.mount('#card-cvc')

    stripeForm.addEventListener('submit', () => {
      event.preventDefault()

      stripe.createToken(cardNumber, cardExpiry, cardCvc)
        .then(response => {
          const hiddenField = document.createElement('input')
          hiddenField.setAttribute('type', 'hidden')
          hiddenField.setAttribute('name', 'stripeToken')
          hiddenField.setAttribute('value', response.token.id)
          stripeForm.appendChild(hiddenField)
          stripeForm.submit()
        })
    })
  }
})

module.exports = {
  greeting: function (event, context) {
    console.log(event)
    return "Hello world, from a Kubeless function!. Passed in data: " + JSON.stringify(event.data)
  }
}
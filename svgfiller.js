<script>
var networkOutputBinding = new Shiny.OutputBinding();
$.extend(networkOutputBinding, {
    find: function(scope) {
      return $(scope).find('.shiny-network-output');
    },
    renderValue: function(el, data) {
          //use join() to combine the array of strings that comprise the svg code
          $(el).html(data.join());      
    }
  });
  Shiny.outputBindings.register(networkOutputBinding, 'timelyportfolio.networkbinding');

</script>
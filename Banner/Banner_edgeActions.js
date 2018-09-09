/***********************
* Adobe Edge Animate Composition Actions
*
* Edit this file with caution, being careful to preserve 
* function signatures and comments starting with 'Edge' to maintain the 
* ability to interact with these actions from within Adobe Edge Animate
*
***********************/
(function($, Edge, compId){
var Composition = Edge.Composition, Symbol = Edge.Symbol; // aliases for commonly used Edge classes

   //Edge symbol: 'stage'
   (function(symbolName) {
      
      
      Symbol.bindElementAction(compId, symbolName, "${Started}", "mouseenter", function(sym, e) {
         // insert code to be run when the mouse enters an element
         sym.getSymbol("Started").play("startover");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Started}", "mouseleave", function(sym, e) {
         // insert code to be run when the mouse leaves an element
         sym.getSymbol("Started").playReverse();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Started}", "mouseover", function(sym, e) {
         // insert code to be run when the mouse hovers over the object
         // Play the timeline at a label or specific time. For example:
         // sym.play(500); or sym.play("myLabel");
         sym.getSymbol("Logo").play("jump");
         

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 5250, function(sym, e) {
         // insert code here
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Started}", "click", function(sym, e) {
         // insert code for mouse click here
         // Play the timeline at a label or specific time. For example:
         // sym.play(500); or sym.play("myLabel");
         sym.play("screen2");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Back2}", "mouseenter", function(sym, e) {
         // insert code to be run when the mouse enters an element
         sym.getSymbol("Back2").play("backover");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Back2}", "mouseleave", function(sym, e) {
         // insert code to be run when the mouse leaves an element
         sym.getSymbol("Back2").playReverse();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Back2}", "click", function(sym, e) {
         // insert code for mouse click here
         sym.playReverse();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${In}", "mouseenter", function(sym, e) {
         // insert code to be run when the mouse enters an element
         // Play the timeline at a label or specific time. For example:
         // sym.play(500); or sym.play("myLabel");
         sym.getSymbol("In").play("inover");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${In}", "mouseleave", function(sym, e) {
         // insert code to be run when the mouse leaves an element
         sym.getSymbol("In").playReverse();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Up}", "mouseenter", function(sym, e) {
         // insert code to be run when the mouse enters an element
         // Play the timeline at a label or specific time. For example:
         // sym.play(500); or sym.play("myLabel");
         sym.getSymbol("Up").play("upover");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Up}", "mouseleave", function(sym, e) {
         // insert code to be run when the mouse leaves an element
         sym.getSymbol("Up").playReverse();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Welcome2}", "mouseenter", function(sym, e) {
         // insert code to be run when the mouse enters an element
         // Play the timeline at a label or specific time. For example:
         // sym.play(500); or sym.play("myLabel");
         sym.getSymbol("Welcome2").play("welover");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Welcome2}", "mouseleave", function(sym, e) {
         // insert code to be run when the mouse leaves an element
         sym.getSymbol("Welcome2").playReverse();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${In}", "click", function(sym, e) {
         // insert code for mouse click here
         // Navigate to a new URL in the current window
         // (replace "_self" with appropriate target attribute)
         window.open("LOGIN.html", "_self");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${Up}", "click", function(sym, e) {
         // insert code for mouse click here
         // Navigate to a new URL in the current window
         // (replace "_self" with appropriate target attribute)
         window.open("REGISTRATION.html", "_self");
         

      });
      //Edge binding end

   })("stage");
   //Edge symbol end:'stage'

   //=========================================================
   
   //Edge symbol: 'Logo'
   (function(symbolName) {   
   
   })("Logo");
   //Edge symbol end:'Logo'

   //=========================================================
   
   //Edge symbol: 'Started'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 250, function(sym, e) {
         // insert code here
         sym.stop();

      });
      //Edge binding end

   })("Started");
   //Edge symbol end:'Started'

   //=========================================================
   
   //Edge symbol: 'Back'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 241, function(sym, e) {
         // insert code here
         sym.stop();

      });
      //Edge binding end

   })("Back");
   //Edge symbol end:'Back'

   //=========================================================
   
   //Edge symbol: 'In'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 250, function(sym, e) {
         // insert code here
         sym.stop();

      });
      //Edge binding end

   })("In");
   //Edge symbol end:'In'

   //=========================================================
   
   //Edge symbol: 'Up'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 250, function(sym, e) {
         // insert code here
         sym.stop();

      });
      //Edge binding end

   })("Up");
   //Edge symbol end:'Up'

   //=========================================================
   
   //Edge symbol: 'Welcome'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 3750, function(sym, e) {
         // insert code here
         sym.stop();

      });
      //Edge binding end

   })("Welcome");
   //Edge symbol end:'Welcome'

})(window.jQuery || AdobeEdge.$, AdobeEdge, "EDGE-2024045");
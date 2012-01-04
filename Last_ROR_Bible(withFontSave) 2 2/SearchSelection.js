function highlightselectedstring(color) 
{
	var txt = window.getSelection().toString();
	//highlightstring(txt,color);
	applyClassToSelection("myClass", color);
	return txt;
}
//highlightselectedstring();
//f();

function highlightstring(keyword,color)
{
	MyApp_HighlightAllOccurencesOfStringForElement(document.body, keyword, color);
}
//
//function getSelectionRange()
//{
// // all browsers, except IE before version 9
//	var selObj = window.getSelection ();   
//	var range = selObj.getRangeAt(0);   
//	return ( range.startOffset + '|' + range.endOffset + '|' + range.startContainer.tagName + '|' + range.endContainer.tagName);
//}
 
// helper function, recursively searches in elements and their child nodes
function MyApp_HighlightAllOccurencesOfStringForElement(element, keyword, color) {
	if (element) 
	{
		 if(element.nodeType ==3 ) //text node
		 {        
			while (true) 
			{
				var value = element.nodeValue;  // Search for keyword in text node
				var idx = value.indexOf(keyword);
				
				if (idx < 0) break;             // not found, abort
				
				
				var span = document.createElement("span");
				span.style.backgroundColor=color;//"yellow";
				span.style.color="black";
				
					
				var text = document.createTextNode(value.substr(idx,keyword.length));
				span.appendChild(text);
				span.setAttribute("class","MyAppHighlight");
				
				
				text = document.createTextNode(value.substr(idx+keyword.length));
				element.deleteData(idx, value.length - idx);
				
				var next = element.nextSibling;
				element.parentNode.insertBefore(span, next);
				element.parentNode.insertBefore(text, next);
			}
		} 
		else if (element.nodeType == 1) // Element node
		 { 
		 
			if (element.style.display != "none" && element.nodeName!= 'select')
			 {
			 
				for (var i=element.childNodes.length-1; i>=0; i--) 
				{   //alert(i);
					MyApp_HighlightAllOccurencesOfStringForElement(element.childNodes[i],keyword,color);
					///alert("AMar");

				}
				
			}
		}
	}
	
}

 var nextId = 0;    
var rangeIntersectsNode = (typeof window.Range != "undefined"&& Range.prototype.intersectsNode) ? 
function(range, node) {    
	return range.intersectsNode(node);     
} :      
function(range, node) {     
	var nodeRange = node.ownerDocument.createRange();      
	try {            
		nodeRange.selectNode(node);   
	} catch (e) {  
		nodeRange.selectNodeContents(node);     
	}           
	return range.compareBoundaryPoints(Range.END_TO_START, nodeRange) == -1 &&
    range.compareBoundaryPoints(Range.START_TO_END, nodeRange) == 1;     
};    

function applyClassToSelection(cssClass, color) {   
	var uniqueCssClass = "selection_" + (++nextId);   
	var sel = window.getSelection();       
	if (sel.rangeCount < 1) {   
		return;       
	}      
	var range = sel.getRangeAt(0);     
    var startNode = range.startContainer, endNode = range.endContainer;  
	// Split the start and end container text nodes, if necessary       
	if (endNode.nodeType == 3) {    
		endNode.splitText(range.endOffset);     
        range.setEnd(endNode, endNode.length);  
	}        
	if (startNode.nodeType == 3) {       
		startNode = startNode.splitText(range.startOffset);      
		range.setStart(startNode, 0);   
	}          // Create an array of all the text nodes in the selection         // using a TreeWalker        
	var containerElement = range.commonAncestorContainer;   
	if (containerElement.nodeType != 1) {   
		containerElement = containerElement.parentNode;    
	}      
    var treeWalker = document.createTreeWalker(          
											   containerElement,  
											   NodeFilter.SHOW_TEXT,      
											   // Note that Range.intersectsNode is non-standard but             // implemented in WebKit      
											   function(node) {           
											   return rangeIntersectsNode(range, node) ?      
											   NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT; 
											   },         
											   false     
											   );   
	var selectedTextNodes = [];       
	while (treeWalker.nextNode()) {     
        selectedTextNodes.push(treeWalker.currentNode);   
	}         
	var textNode, span;    
	// Place each text node within range inside a <span>    
	// element with the desired class    
	for (var i = 0, len = selectedTextNodes.length; i < len; ++i) {       
		textNode = selectedTextNodes[i];          
		span = document.createElement("span");   
		span.style.backgroundColor=color	;//"yellow";
//		span.style.color="black";
		span.className = cssClass + " " + uniqueCssClass;      
		textNode.parentNode.insertBefore(span, textNode);    
		span.appendChild(textNode);     
    }        
	return uniqueCssClass;    
}     

function removeSpansWithClass(cssClass) 
{       
	var spans = document.body.getElementsByClassName(cssClass),    
	span, parentNode;         
	// Convert spans to an array to prevent live updating of         
	// the list as we remove the spans         spans = Array.prototype.slice.call(spans, 0);   
	for (var i = 0, len = spans.length; i < len; ++i) 
	{          
		span = spans[i];    
		parentNode = span.parentNode;     
        parentNode.insertBefore(span.firstChild, span);  
		parentNode.removeChild(span);        
		// Glue any adjacent text nodes back together 
		parentNode.normalize();    
	}  
}     
var c; 






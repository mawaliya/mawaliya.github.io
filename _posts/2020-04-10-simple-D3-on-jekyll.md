---
title: Simple D3.js on Jekyll
published: true
categories: "Data-Science"
---

<script src="https://d3js.org/d3.v5.min.js"></script>

<script>
    d3.csv("/assets/examples-simple.csv")
        .then(function (data) {
            d3.select("svg#demo1")
            .selectAll("cirlce")
            .data(data)
            .enter()
            .append("circle")
            .attr("r", 5)
            .attr("fill", "red")
            .attr("cx", function(d) {return d["x"]})
            .attr("cy", function(d) {return d["y"]});
        });
    
</script>

<svg id="demo1" width="600" height="300" style="background: lightgrey"></svg>

<p>This is a simple example of embedding D3.js graphic in Jekyll</p>

{% highlight html linenos %}

<script src="https://d3js.org/d3.v5.min.js"></script>

<script>
    d3.csv("/assets/examples-simple.csv")
        .then(function (data) {
            d3.select("svg#demo1")
            .selectAll("cirlce")
            .data(data)
            .enter()
            .append("circle")
            .attr("r", 5)
            .attr("fill", "red")
            .attr("cx", function(d) {return d["x"]})
            .attr("cy", function(d) {return d["y"]});
        });  
</script>

<svg id="demo1" width="600" height="300" style="background: lightgrey"></svg>
{% endhighlight %}

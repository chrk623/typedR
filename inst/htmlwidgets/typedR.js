HTMLWidgets.widget({

    name: 'typedR',

    type: 'output',

    factory: function (el, width, height) {
        let panel_width = width;
        let panel_height = height;

        return {

            renderValue: function (pass_obj) {
                let term_width = panel_width * pass_obj.ratio;
                let term_body_height = panel_height * pass_obj.ratio;
                let term_head_height = term_body_height / 25;

                pass_obj.typed_args.strings = [pass_obj.typed_args.strings];

                let theme = pass_obj.style_args.theme;
                let panel_background = pass_obj.style_args.panel_background;

                // draw in term_panel
                d3.select("body")
                    .append("div")
                    .attr("id", "term_panel")
                    .style("height", `${panel_height}px`)
                    .style("width", `${panel_width}px`)
                    .style("background", panel_background);
                // panel selection
                let pan = d3.select("#term_panel");
                // terminal head
                pan.append("div")
                    .attr("class", "term_head_" + theme)
                    .attr("id", "term_head")
                    .style("width", `${term_width}px`)
                    .style("height", `${term_head_height}px`);
                // terminal head text
                d3.select("#term_head")
                    .append("p")
                    .attr("class", "term_head_text_" + theme)
                    .text(`R Console ${script_name_mac("helloworld")}`)
                    .style("font-size", `${term_head_height * 0.5}px`);
                // terminal body
                pan.append("div")
                    .attr("class", "term_body_mac")
                    .attr("id", "term_body")
                    .style("width", `${term_width}px`)
                    .style("height", `${term_body_height}px`);
                // text
                d3.select(".term_body_mac")
                    .append("div")
                    .attr("class", "console_body")
                    .style("font-size", `${term_head_height * 0.85}px`)
                    .style("margin", `${term_head_height * 0.4}px`)
                    .style("padding", `${term_head_height * 0.4}px`)
                    .append("p")
                    .attr("class", "pointer")
                    .text(">");

                d3.select(".console_body")
                    .append("span")
                    .style("font-size", `${term_head_height * 0.85}px`)
                    .style("margin-left", `${term_head_height * 0.4}px`)
                    .append("p")
                    .attr("class", "code_body");

                var typed = new Typed('.code_body',
                    pass_obj.typed_args
                );

            },

            resize: function (width, height) {

            }
        };
    }
});

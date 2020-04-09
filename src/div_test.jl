export html_center_test
"""
    html_center_test(;kwags...)
    html_center_test(children::Any;kwags...)
    html_center_test(children_maker::Function;kwags...)


Center is a wrapper for the <center> HTML5 element.
For detailed attribute info see:
https://developer.mozilla.org/en-US/docs/Web/HTML/Element/center

# Arguments
- `id` - The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.
- `children` - The children of this component
- `n_clicks` - An integer that represents the number of times
that this element has been clicked on.
- `n_clicks_timestamp` - An integer that represents the time (in ms since 1970)
at which n_clicks changed. This can be used to tell
which button was changed most recently.
- `key` - A unique identifier for the component, used to improve
performance by React.js while rendering components
See https://reactjs.org/docs/lists-and-keys.html for more info
- `role` - The ARIA role attribute
- `data-*` - A wildcard data attribute
- `aria-*` - A wildcard aria attribute
- `accessKey` - Defines a keyboard shortcut to activate or add focus to the element.
- `className` - Often used with CSS to style elements with common properties.
- `contentEditable` - Indicates whether the element's content is editable.
- `contextMenu` - Defines the ID of a <menu> element which will serve as the element's context menu.
- `dir` - Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
- `draggable` - Defines whether the element can be dragged.
- `hidden` - Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
- `lang` - Defines the language used in the element.
- `spellCheck` - Indicates whether spell checking is allowed for the element.
- `style` - Defines CSS styles which will override styles previously set.
- `tabIndex` - Overrides the browser's default tab order and follows the one specified instead.
- `title` - Text to be displayed in a tooltip when hovering over the element.
- `loading_state` - Object that holds the loading state object coming from dash-renderer


"""
function html_center_test(; kwargs...)
    
        avaible_props = Set(Symbol[:key, :loading_state, :contextMenu, :n_clicks_timestamp, :draggable, :accessKey, :hidden, :title, :lang, :n_clicks, :contentEditable, :style, :children, :id, :role, :spellCheck, :tabIndex, :className, :dir])
    
        wild_props = Set(Symbol[Symbol("data-"), Symbol("aria-")])
    
        wild_regs = r"^(?<prop>data-|aria-)"
    
        result = Component("Center", "dash_html_components", Dict{Symbol, Any}(), avaible_props, Set(Symbol[Symbol("data-"), Symbol("aria-")]))
    
        for (prop, value) = pairs(kwargs)
           
            m = match(wild_regs, string(prop))
           
            if (length(wild_props) == 0 || isnothing(m)) && !(prop in avaible_props)
               
                throw(ArgumentError("Invalid property $(string(prop)) for component " * "html_center"))
            end
            
            push!(result.props, prop => Front.to_dash(value))
        end
    
    
    return result
end

function html_center_test(children::Any; kwargs...)    
    result = html_center_test(;kwargs...)    
    push!(result.props, :children => Front.to_dash(children))
    return result
end

html_center_test(children_maker::Function; kwargs...) = html_center_test(children_maker(); kwargs...)
export html_center_test
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
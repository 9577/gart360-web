module FlashBlockHelper
        def flash_block(options={})
                content = []

                flash.each do |type, message|
                        content << bs_alert(type, message)
                end

                content_tag :div, content.join("\n").html_safe, options
        end

        def bs_alert(type, message, options={})
                alert_options = options.dup
                alert_options[:class] = parse_html_classes_to_arr alert_options[:class]
                alert_options[:class] << 'alert'
                alert_options[:class] << 'alert-dismissable'
                alert_options[:class] << alert_class(type)

                content = []
                content << content_tag(:button, '&times'.html_safe, class: 'close', type: 'button', data: {dismiss: :alert}, aria: {hidden: 'true'})
                content << message

                content_tag :div, content.join("\n").html_safe, alert_options
                # content_tag :p, options[:opt].join("\n").html_safe
        end

        private
        #Render rules
        #- `:success` render as `.alert-success`;
        #- `:info` render as `.alert-info`;
        #- `:warning` render as `.alert-warning`;
        #- `:danger` render as `.alert-danger`;
        #- `:notice` render as `.alert-success`;
        #- `:alert` render as `.alert-danger`;
        #- another keys render as `alert-info`.
        def alert_class(type)
                act_type =
                        case type
                                when :success, :notice then :success
                                when :danger, :alert then :danger
                                when :warning, :info then type
                                else :info
                        end

                "alert-#{act_type}"
        end
        def parse_html_classes_to_arr(classes)
                case classes
                        when NilClass then []
                        when String, Symbol then [classes.to_s]
                        when Array then classes.map { |c| c.to_s }
                end
        end

        def add_html_class(classes, added_class)
                unless classes.include? added_class
                        classes << added_class
                end
        end
end
module ModalDialogHelper
        def modal_dialog(options={})
                modal_dialog_options = options.dup
                modal_dialog_options[:class] = parse_html_classes_to_arr modal_dialog_options[:class]
                modal_dialog_options[:class] << 'modal'
                modal_dialog_options[:class] << 'fade'

                modal_header = modal_dialog_options.delete :header
                modal_body = modal_dialog_options.delete :body
                modal_footer = modal_dialog_options.delete :footer

                modal_dialog_builder = ModalDialog.new self, modal_header, modal_body, modal_footer

                content = modal_dialog_builder.render

                content_tag :div, content, modal_dialog_options
        end

        def dismiss_button(text, options={})
                #<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                button_options = options.dup
                button_options[:class] = parse_html_classes_to_arr button_options[:class]
                button_options[:class] << 'btn'
                button_options[:data] ||= {}
                button_options[:data][:dismiss] = 'modal'

                unless button_options[:class].join =~ /btn-(?>default|primary|warning|success|info|danger|link)/
                        button_options[:class] << 'btn-default'
                end

                content_tag :button, text, button_options
        end

        class ModalDialog
                attr_accessor :parent, :header, :body, :footer
                delegate :content_tag, to: :parent

                def initialize(parent, header, body, footer)
                        @parent = parent
                        @header = header
                        @body = body
                        @footer = footer
                end

                def render
                        content_tag :div, modal_content_block, class: 'modal-dialog'
                end

                private
                def modal_content_block
                        content = []
                        content << modal_header_block
                        content << modal_body_block
                        content << modal_footer_block

                        content_tag :div, content.join("\n").html_safe, class: 'modal-content'
                end

                def modal_header_block
                        if @header
                                content_tag :div, close_button + @header, class: 'modal-header'
                        end
                end

                def close_button
                        content_tag :button, '&times'.html_safe, type: 'button', class: 'close', data: {dismiss: 'modal'}, aria: {hidden: 'true'}
                end

                def modal_body_block
                        content_tag :div, @body, class: 'modal-body'
                end

                def modal_footer_block
                        if @footer
                                content_tag :div, @footer, class: 'modal-footer'
                        end
                end
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
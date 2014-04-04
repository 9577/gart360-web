# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'parsley-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'col-sm-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    end
  end
  
  config.wrappers :readonly, tag: 'div', class: 'form-group', error_class: 'parsley-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :readonly
    b.wrapper tag: 'div', class: 'col-sm-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :search_form_single, tag: 'div', class: 'form-group col-sm-12 search_form_single' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
  end

  config.wrappers :search_form_multi, tag: 'div', class: 'form-group search_form_multi' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'each_input' do |ba|
      ba.use :input
    end
  end

  config.wrappers :prepend, tag: 'div', class: "form-group", error_class: 'parsley-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
  end

  config.wrappers :sns, tag: 'div', class: "form-group", error_class: 'parsley-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :append, tag: 'div', class: "form-group", error_class: 'parsley-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :no_label, class: 'form-group' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'col-sm-12' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :icon, tag: 'div', class: "form-group", error_class: 'parsley-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'input-icon' do |input|
      input.use :input
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end

module Images
  class Generator
    THUMBNAIL_MODEL = 1

    # 图片定义在 lib/extras/images/definition
    include Images::Definition

    def initialize(record, column)
      @record = record
      @column = column
    end

    def defined_versions
      @defined_versions ||= self.class::VERSIONS.inject({}){|memo,(k,v)| memo[k.to_s] = v; memo}
    end

    def url(version = '')
      if version.present?
        version = version.to_s

        unless defined_versions.key?(version)
          raise "CoverUploader version: #{version} is not allow."
        end

        column_value + version_string(version)
      else
        column_value
      end
    end

    private

    def column_value
      @record.send(@column)
    end

    def version_string(version)
      return '' if version.blank?
      size = defined_versions[version]

      str = "?imageView/" << (size[:thumbnail_model].present? ? size[:thumbnail_model] : self.class::THUMBNAIL_MODEL).to_s
      str = [str, 'w', size[:width]].join('/') if size[:width]
      str = [str, 'h', size[:height]].join('/') if size[:height]

      # force format to jpg
      str += '/format/jpg'
      str
    end
  end
end

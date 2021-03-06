module BannerLite
  class ImageBanner < Banner
    attr_accessor :file
    validates :file, presence: true, if: ->(b){ b.file_name.blank? }

    before_save :fill_file_name, if: :file
    after_save :save_file, if: :file
    after_destroy :remove_file

    def src
      "/system/#{id}/#{file_name}"
    end

    private
      def base_dir
        @base_dir ||= Rails.root.join('public', 'system', id.to_s)
      end

      def fill_file_name
        self.file_name = file.original_filename
      end

      def remove_file
        FileUtils.rm_rf(base_dir)
      end

      def save_file
        FileUtils.mkdir(base_dir) unless File.directory?(base_dir)
        File.open(base_dir + file_name, 'wb'){|f| f.write(file.read) }
      end
  end
end

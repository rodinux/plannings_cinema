if Rails.env.staging? || Rails.env.production?
  exe_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
else
  exe_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
end


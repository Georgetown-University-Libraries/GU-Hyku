# frozen_string_literal: true

Flipflop.configure do
  feature :use_pdf_viewer,
          default: true,
          description: "Use embedded PDF viewer instead of displaying thumbnail and action buttons"
  
  feature :show_featured_researcher,
          default: false,
          description: "Shows the Featured Researcher tab on the homepage."

  feature :show_share_button,
          default: false,
          description: "Shows the 'Share Your Work' button on the homepage."

  feature :show_featured_works,
          default: false,
          description: "Shows the Featured Works tab on the homepage."

  feature :show_recently_uploaded,
          default: true,
          description: "Shows the Recently Uploaded tab on the homepage."
end
  
module ApplicationHelper
  def admin?
    session[:admin]
  end

  def dark?
    session[:dark]
  end

  def style_headerfooter
    dark? ? 'bg-red3 text-grey0' : 'bg-red3 text-grey0'
  end

  def style_body
    dark? ? 'bg-grey5 text-grey0' : 'bg-grey0'
  end

  def style_body2
    dark? ? 'bg-grey4 text-grey0' : 'bg-grey1'
  end

  def style_background
    dark? ? 'bg-grey6' : 'bg-grey3'
  end

  def style_link
    dark? ? 'text-white' : 'text-primary'
  end

  def style_nav_buttons
    dark? ? 'text-white' : ''
  end

  def style_search_buttons
    dark? ? 'btn-outline-grey0' : 'btn-outline-red3'
  end

  def change_mode_path
    dark? ? light_path : dark_path
  end

  def change_mode_name
    dark? ? 'Light Mode' : 'Dark Mode'
  end
end

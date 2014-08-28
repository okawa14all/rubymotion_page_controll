class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
    @scroll_view_height = app_height - 70
    @page_size = 3
  end

  def root_view(st)
    st.background_color = color.white
  end

  def scroll_view(st)
    st.frame = { t: 0, l: 0, w: app_width, h: @scroll_view_height }
    st.paging = true
    st.scroll_enabled = true
    st.shows_horizontal_scroll_indicator = false
    st.shows_vertical_scroll_indicator = false
    st.content_size = CGSizeMake((@page_size * app_width), app_height)
  end

  def page_1(st)
    page_content st
    st.frame = { t: 0, l: 0, w: app_width, h: @scroll_view_height }
    st.text = '1'
  end

  def page_2(st)
    page_content st
    st.frame = { t: 0, l: app_width, w: app_width, h: @scroll_view_height }
    st.text = '2'
  end

  def page_3(st)
    page_content st
    st.frame = { t: 0, l: app_width * 2, w: app_width, h: @scroll_view_height }
    st.text = '3'
  end

  def page_content(st)
    st.text_alignment = :center
    st.color = color.white
    st.font = font.large
    st.background_color = color.tint
  end

  def page_controll(st)
    st.frame = { t: @scroll_view_height - 50, l: 0, w: app_width, h: 50 }
    st.current_page = 0
    st.number_of_pages = @page_size
  end

  def some_button(st)
    st.frame = { l: 0, b: app_height, w: app_width, h: 70 }
    st.text = 'Button'
    st.background_color = color.battleship_gray
    st.color = color.white
    st.font = font.medium
  end

end

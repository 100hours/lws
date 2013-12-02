module ApplicationHelper
  def title_or_default(title)
    return title unless title.blank?
    "<em>Untitled</em>"
  end

  def active_on(title)
    "active" if content_for(:page_title) == title
  end

  def writer_event_title(writer)
    writer.name + (writer.event ? ", #{writer.event.name}" : "")
  end

  def gallery_images
    { 
      1 => "Sarah concentrating in Woolfson and Tay",
      2 => "Sarah's words projected on the blinds",
      3 => "Sarah resists the cake and focuses on writing",
      4 => "Contributors make requests at the NPG",
      5 => "A happy patron takes a photo of her piece on the gallery wall",
      6 => "What would you like me to write?",
      7 => "It's a work of art",
      8 => "David thinks",
      9 => "No shortgae of ideas to work with",
      10 => "Sarah at work in the bookshop",
      11 => "Actor Eddie Redmayne watches his contribution being incorporated",
      12 => "Eddie Redmayne's contribution",
      13 => "A small request",
      14 => "Sarah entertians the crowd",
      15 => "Sarah, still smiling",
      16 => "Gemma begins her writing odyssey",
      17 => "Joe at the Jewish Museum's football exhibition",
      18 => "Gemma's mobile live writing setup",
      19 => "David with an audience at the NPG",
      20 => "David with the ultimate literary patron",
      21 => "Joe hears someone else's story",
      22 => "Joe talks to a contributor",
      23 => "A boxing poem, written live",
      24 => "Joe takes sport as his inspiration",
      25 => "Poet Nik Way adds his contribution",
      26 => "Dizz writes live",
      27 => "Sara at the Deptford Lounge",
      28 => "Spread the Word's Paul Sherreard tinkles the keyboard",
      29 => "Deanna deep in thought",
      30 => "Library user Patrick Chike shares a story",
      31 => "Multiple platforms in use",
      32 => "Poetry for inspiration at the Deptford Lounge",
      33 => "Jacon takes to the keyboard",
      34 => "You just stare at the screen until drops of blood form on your forehead",
      35 => "Presenting Molly Naylor",
      36 => "Molly in full flow",
      37 => "Having a laugh at the Roundhouse"
    }
  end
end

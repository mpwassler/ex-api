# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:

alias RiverApi.Rivers.Trip

RiverApi.Repo.delete_all RiverApi.Rivers.Trip

RiverApi.Repo.insert %Trip{
	title: "A sample trip",
	description: "a sample",
	date_of: DateTime.truncate(DateTime.utc_now, :second)
}

RiverApi.Repo.insert %Trip{
	title: "A Second sample trip",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, sapiente sunt nihil dolorum provident facilis tenetur veritatis ea atque. Eum commodi ducimus suscipit odio, obcaecati voluptatibus repellat tenetur maxime nemo.",
	date_of: DateTime.truncate(DateTime.utc_now, :second)
}

RiverApi.Repo.insert %Trip{
	title: "A Third sample trip",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi assumenda id nostrum fuga quod laboriosam, vero quas vel, totam sint est nemo rerum ad, asperiores tempora. Consectetur, quia, aut!",
	date_of: DateTime.truncate(DateTime.utc_now, :second)
}
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

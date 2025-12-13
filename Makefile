serve:
	hugo serve -D

update_theme:
	git submodule update --init --recursive --remote

new_post:
	hugo new posts/change_the_title.md
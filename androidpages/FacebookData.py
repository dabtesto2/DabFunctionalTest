import facebook
import json

token = "EAAhW5zZBlA3IBAGzAevjtREZBZC3PoAsNw7b50wqxZA7ZC4CPNQXGYIJ1MckvZB2LLOiVf2BX5HZBU3UHVuFGilJJutOd0GS8MZAQPBeQjdwsYqVMdFCQv3Ez8MolQIWtv9r1s4J7JysnowfjJc51rIBhDvSpT7f2YPY8OYGmgCft4BJMaiAe51P"


class FacebookData:

    def __init__(self, token):

        self.token = token

    def get_user_videos(self):
        video_entries = []
        graph = facebook.GraphAPI(self.token)
        user_video_obj = graph.get_object('me/videos/uploaded/', fields='source')
        user_videos = json.dumps(user_video_obj, indent=4)
        video_data = json.loads(user_videos)
        for video_data_in_list in video_data.values():  # this gives a list
            for list_index in range(len(video_data_in_list)):  # iterate to length of list
                try:
                    video_dict_item = video_data_in_list[list_index]  # dictionary get value = key source
                    # print(video_dict_item['source'])
                    video_entries.append(video_dict_item['source'])
                except Exception as e:
                    pass
        return video_entries

    def get_user_photos(self):
        photo_entries = []
        graph = facebook.GraphAPI(self.token)
        user_photos_obj = graph.get_object('me/photos/uploaded/', fields='picture')
        user_photos = json.dumps(user_photos_obj, indent=4)
        photo_data = json.loads(user_photos)
        for photo_data_in_list in photo_data.values():  # this gives a list
            for list_index in range(len(photo_data_in_list)):  # iterate to length of list
                try:
                    photo_dict_item = photo_data_in_list[list_index]  # dictionary get value = key source
                    # print(photo_dict_item['picture'])
                    photo_entries.append(photo_dict_item['picture'])
                except Exception as e:
                    pass
        return photo_entries

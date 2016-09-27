require 'test_helper'

class ReserveSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserve_song = reserve_songs(:one)
  end

  test "should get index" do
    get reserve_songs_url
    assert_response :success
  end

  test "should get new" do
    get new_reserve_song_url
    assert_response :success
  end

  test "should create reserve_song" do
    assert_difference('ReserveSong.count') do
      post reserve_songs_url, params: { reserve_song: { box_id: @reserve_song.box_id, create_time: @reserve_song.create_time, description: @reserve_song.description, local_video: @reserve_song.local_video, rate_stage: @reserve_song.rate_stage, reserver_id: @reserve_song.reserver_id, song_id: @reserve_song.song_id, state: @reserve_song.state } }
    end

    assert_redirected_to reserve_song_url(ReserveSong.last)
  end

  test "should show reserve_song" do
    get reserve_song_url(@reserve_song)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserve_song_url(@reserve_song)
    assert_response :success
  end

  test "should update reserve_song" do
    patch reserve_song_url(@reserve_song), params: { reserve_song: { box_id: @reserve_song.box_id, create_time: @reserve_song.create_time, description: @reserve_song.description, local_video: @reserve_song.local_video, rate_stage: @reserve_song.rate_stage, reserver_id: @reserve_song.reserver_id, song_id: @reserve_song.song_id, state: @reserve_song.state } }
    assert_redirected_to reserve_song_url(@reserve_song)
  end

  test "should destroy reserve_song" do
    assert_difference('ReserveSong.count', -1) do
      delete reserve_song_url(@reserve_song)
    end

    assert_redirected_to reserve_songs_url
  end
end

package com.niusounds.fl_player

import android.content.Context
import android.database.Cursor
import android.provider.MediaStore

object NativeLibrary {
    fun getAllArtists(context: Context): List<Map<String, Any>> {
        val cursor: Cursor? = context.contentResolver.query(MediaStore.Audio.Artists.EXTERNAL_CONTENT_URI, arrayOf(
                MediaStore.Audio.Artists._ID,
                MediaStore.Audio.Artists.ARTIST,
                MediaStore.Audio.Artists.NUMBER_OF_TRACKS,
                MediaStore.Audio.Artists.NUMBER_OF_ALBUMS
        ), null, null, MediaStore.Audio.Artists.ARTIST + " ASC")

        cursor?.use {
            return it.asMap()
        }

        return emptyList()
    }

    fun getAlbumsForArtist(context: Context, artist: String): List<Map<String, Any>> {
        val cursor: Cursor? = context.contentResolver.query(MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI, arrayOf(
                MediaStore.Audio.Albums._ID,
                MediaStore.Audio.Albums.ALBUM,
                MediaStore.Audio.Albums.ALBUM_ART,
                MediaStore.Audio.Albums.ALBUM_ID,
                MediaStore.Audio.Albums.NUMBER_OF_SONGS,
                MediaStore.Audio.Albums.FIRST_YEAR,
                MediaStore.Audio.Albums.LAST_YEAR
        ), MediaStore.Audio.Albums.ARTIST + "=?", arrayOf(artist), MediaStore.Audio.Albums.FIRST_YEAR + " DESC")

        cursor?.use {
            return it.asMap()
        }

        return emptyList()
    }

    fun getSongsForAlbum(context: Context, albumId: Int): List<Map<String, Any>> {
        val cursor: Cursor? = context.contentResolver.query(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, arrayOf(
                MediaStore.Audio.Media._ID,
                MediaStore.Audio.Media.ALBUM_ID,
                MediaStore.Audio.Media.ALBUM,
                MediaStore.Audio.Media.ARTIST_ID,
                MediaStore.Audio.Media.ARTIST_KEY,
                MediaStore.Audio.Media.ARTIST,
                MediaStore.Audio.Media.COMPOSER,
                MediaStore.Audio.Media.DATA,
                MediaStore.Audio.Media.DATE_ADDED,
                MediaStore.Audio.Media.DATE_MODIFIED,
                MediaStore.Audio.Media.DURATION,
                MediaStore.Audio.Media.DISPLAY_NAME,
                MediaStore.Audio.Media.SIZE,
                MediaStore.Audio.Media.TITLE,
                MediaStore.Audio.Media.TITLE_KEY,
                MediaStore.Audio.Media.TRACK,
                MediaStore.Audio.Media.YEAR
        ), MediaStore.Audio.Media.ALBUM_ID + "=?", arrayOf(albumId.toString()), MediaStore.Audio.Media.TRACK + " ASC")

        cursor?.use {
            return it.asMap()
        }

        return emptyList()
    }

    private fun Cursor.asMap(): List<Map<String, Any>> {
        val result = mutableListOf<Map<String, Any>>()
        while (moveToNext()) {
            val map = mutableMapOf<String, Any>()
            for (i in 0..columnCount) {
                when (getType(i)) {
                    Cursor.FIELD_TYPE_FLOAT -> {
                        map[getColumnName(i)] = getFloat(i)
                    }
                    Cursor.FIELD_TYPE_BLOB -> {
                        map[getColumnName(i)] = getBlob(i)
                    }
                    Cursor.FIELD_TYPE_INTEGER -> {
                        map[getColumnName(i)] = getInt(i)
                    }
                    Cursor.FIELD_TYPE_STRING -> {
                        map[getColumnName(i)] = getString(i)
                    }
                }
            }
            result.add(map)
        }
        return result
    }
}
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
            val result = mutableListOf<Map<String, Any>>()
            while (cursor.moveToNext()) {
                val map = mutableMapOf<String, Any>()
                for (i in 0..cursor.columnCount) {
                    when (cursor.getType(i)) {
                        Cursor.FIELD_TYPE_FLOAT -> {
                            map[cursor.getColumnName(i)] = cursor.getFloat(i)
                        }
                        Cursor.FIELD_TYPE_BLOB -> {
                            map[cursor.getColumnName(i)] = cursor.getBlob(i)
                        }
                        Cursor.FIELD_TYPE_INTEGER -> {
                            map[cursor.getColumnName(i)] = cursor.getInt(i)
                        }
                        Cursor.FIELD_TYPE_STRING -> {
                            map[cursor.getColumnName(i)] = cursor.getString(i)
                        }
                    }
                }
                result.add(map)
            }
            return result
        }

        return emptyList()
    }

    fun getAlbumsForArtist(context: Context, artist: String): List<Map<String, Any>> {
        val cursor: Cursor? = context.contentResolver.query(MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI, arrayOf(
                MediaStore.Audio.Albums._ID,
                MediaStore.Audio.Albums.ARTIST,
                MediaStore.Audio.Albums.ALBUM_ID,
                MediaStore.Audio.Albums.ALBUM_ART,
                MediaStore.Audio.Albums.NUMBER_OF_SONGS
        ), MediaStore.Audio.Albums.ARTIST + "=?", arrayOf(artist), MediaStore.Audio.AlbumColumns.FIRST_YEAR + " DESC")

        cursor?.use {
            val result = mutableListOf<Map<String, Any>>()
            while (cursor.moveToNext()) {
                val map = mutableMapOf<String, Any>()
                for (i in 0..cursor.columnCount) {
                    when (cursor.getType(i)) {
                        Cursor.FIELD_TYPE_FLOAT -> {
                            map[cursor.getColumnName(i)] = cursor.getFloat(i)
                        }
                        Cursor.FIELD_TYPE_BLOB -> {
                            map[cursor.getColumnName(i)] = cursor.getBlob(i)
                        }
                        Cursor.FIELD_TYPE_INTEGER -> {
                            map[cursor.getColumnName(i)] = cursor.getInt(i)
                        }
                        Cursor.FIELD_TYPE_STRING -> {
                            map[cursor.getColumnName(i)] = cursor.getString(i)
                        }
                    }
                }
                result.add(map)
            }
            return result
        }

        return emptyList()
    }
}
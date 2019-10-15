[CCode (cheader_filename="zip/zip.h")]
namespace Zip {
	[Compact]
	[CCode (cname = "struct zip_t", cprefix = "zip_", free_function = "zip_close")]
	class Zip {
		public delegate size_t OnExtract (void *arg, ulong offset, void *buf, size_t bufsize);
		public delegate int OnStaticExtract (string filename, void *arg);

		[CCode (cname = "zip_open")]
		public Zip (string zipname, int level, char mode);
		public void close ();

		public int entry_open (string entryname);
		public int entry_openbyindex (int index);
		public int entry_close ();

		public string entry_name ();
		public int entry_index ();
		public int entry_isdir ();
		public ulong entry_size ();
		public uint entry_crc32 ();

		public int entry_write (void *buf, size_t bufsize);
		public int entry_fwrite (string filename);

		public ssize_t entry_read (void **buf, size_t *bufsize);
		public ssize_t entry_noallocread (void *buf, size_t bufsize);
		public int entry_fread (string filename);

		public int entry_extract (OnExtract on_extract, void *arg);
		public int total_entries ();

		public int create (string zipname, string[] filenames, size_t len);
		public static int extract (string zipname, string dir, OnStaticExtract on_extract, void *arg);
	}

	[CCode (cname = "ZIP_DEFAULT_COMPRESSION_LEVEL")]
	public const int DEFAULT_COMPRESSION_LEVEL;
}
; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [345 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [684 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 195
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 262
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 296
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 337
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 214
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 280
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 280
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 300
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 156596193, ; 21: ExpenseTracker-UI => 0x95577e1 => 0
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 236
	i32 176265551, ; 24: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 25: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 282
	i32 184328833, ; 26: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 27: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 334
	i32 199333315, ; 28: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 335
	i32 205061960, ; 29: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 30: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 234
	i32 220171995, ; 31: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 256
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 37: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 175
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 239
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 258
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 255
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 306
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 334
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 225
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 319
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 257
	i32 347068432, ; 50: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 218
	i32 356389973, ; 51: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 318
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 341
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 61: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 330
	i32 441335492, ; 62: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 240
	i32 442565967, ; 63: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 64: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 253
	i32 451504562, ; 65: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 66: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 67: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 68: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 69: System.dll => 0x1bff388e => 164
	i32 476646585, ; 70: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 255
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 268
	i32 498788369, ; 72: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 73: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 317
	i32 503918385, ; 74: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 311
	i32 513247710, ; 75: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 207
	i32 526420162, ; 76: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 77: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 300
	i32 530272170, ; 78: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 79: Microsoft.Extensions.Logging => 0x20216150 => 203
	i32 540030774, ; 80: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 81: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 82: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 83: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 84: Jsr305Binding => 0x213954e7 => 293
	i32 569601784, ; 85: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 291
	i32 571435654, ; 86: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 198
	i32 577335427, ; 87: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 88: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 325
	i32 601371474, ; 89: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 603890323, ; 90: ExpenseTracker-UI.dll => 0x23fea293 => 0
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 245
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 323
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 251
	i32 643868501, ; 96: System.Net => 0x2660a755 => 81
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 287
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 232
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 102: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 305
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 104: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 302
	i32 693804605, ; 105: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 106: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 107: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 297
	i32 700358131, ; 108: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 109: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 320
	i32 709557578, ; 110: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 308
	i32 720511267, ; 111: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 301
	i32 722857257, ; 112: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 113: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 114: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 216
	i32 752232764, ; 115: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 116: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 222
	i32 759454413, ; 117: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 118: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 329
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 206
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 246
	i32 804008546, ; 123: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 179
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 260
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 273
	i32 873119928, ; 131: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 132: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 133: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 134: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 135: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 136: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 332
	i32 928116545, ; 137: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 296
	i32 952186615, ; 138: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 139: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 301
	i32 966729478, ; 140: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 294
	i32 967690846, ; 141: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 257
	i32 975236339, ; 142: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 143: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 144: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 145: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 148: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 200
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 277
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 194
	i32 1029334545, ; 153: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 307
	i32 1031528504, ; 154: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 295
	i32 1035644815, ; 155: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 230
	i32 1036536393, ; 156: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 264
	i32 1067306892, ; 159: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 160: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 161: Xamarin.Kotlin.StdLib => 0x409e66d8 => 298
	i32 1098259244, ; 162: System => 0x41761b2c => 164
	i32 1106973742, ; 163: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 191
	i32 1118262833, ; 164: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 320
	i32 1121599056, ; 165: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 263
	i32 1127624469, ; 166: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 205
	i32 1149092582, ; 167: Xamarin.AndroidX.Window => 0x447dc2e6 => 290
	i32 1157931901, ; 168: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 183
	i32 1168523401, ; 169: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 326
	i32 1170634674, ; 170: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 171: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 196
	i32 1175144683, ; 172: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 286
	i32 1178241025, ; 173: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 271
	i32 1202000627, ; 174: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 183
	i32 1203215381, ; 175: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 324
	i32 1204270330, ; 176: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 232
	i32 1204575371, ; 177: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 187
	i32 1208641965, ; 178: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 179: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 180: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 322
	i32 1243150071, ; 181: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 291
	i32 1253011324, ; 182: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 183: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 306
	i32 1264511973, ; 184: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 281
	i32 1267360935, ; 185: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 285
	i32 1273260888, ; 186: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 237
	i32 1275534314, ; 187: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 302
	i32 1278448581, ; 188: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 229
	i32 1292207520, ; 189: SQLitePCLRaw.core.dll => 0x4d0585a0 => 217
	i32 1293217323, ; 190: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 248
	i32 1309188875, ; 191: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 192: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 290
	i32 1324164729, ; 193: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 194: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 195: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 196: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 336
	i32 1376866003, ; 197: Xamarin.AndroidX.SavedState => 0x52114ed3 => 277
	i32 1379779777, ; 198: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 199: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 200: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 241
	i32 1408764838, ; 201: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 202: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 203: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 204: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 304
	i32 1434145427, ; 205: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 206: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 294
	i32 1439761251, ; 207: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 208: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 209: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 210: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 197
	i32 1457743152, ; 211: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 212: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 213: es\Microsoft.Maui.Controls.resources => 0x57152abe => 310
	i32 1461234159, ; 214: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 215: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 216: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 217: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 231
	i32 1470490898, ; 218: Microsoft.Extensions.Primitives => 0x57a5e912 => 207
	i32 1479771757, ; 219: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 220: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 221: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 222: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 278
	i32 1490351284, ; 223: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 181
	i32 1493001747, ; 224: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 314
	i32 1514721132, ; 225: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 309
	i32 1521091094, ; 226: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 200
	i32 1536373174, ; 227: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 228: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 229: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 230: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 179
	i32 1550322496, ; 231: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 232: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 329
	i32 1565862583, ; 233: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 234: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 235: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 236: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 237: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 247
	i32 1592978981, ; 238: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 239: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 295
	i32 1601112923, ; 240: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 241: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 242: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 243: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 267
	i32 1622358360, ; 244: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 245: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 289
	i32 1632842087, ; 246: Microsoft.Extensions.Configuration.Json => 0x61533167 => 192
	i32 1635184631, ; 247: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 251
	i32 1636350590, ; 248: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 244
	i32 1639515021, ; 249: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 250: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 251: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 252: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 178
	i32 1657153582, ; 253: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 254: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 283
	i32 1658251792, ; 255: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 292
	i32 1670060433, ; 256: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 239
	i32 1675553242, ; 257: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 258: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 259: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 260: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1688112883, ; 261: Microsoft.Data.Sqlite => 0x649e8ef3 => 181
	i32 1689493916, ; 262: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 182
	i32 1691477237, ; 263: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 264: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 265: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 299
	i32 1701541528, ; 266: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 267: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 218
	i32 1720223769, ; 268: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 260
	i32 1726116996, ; 269: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 270: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 271: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 235
	i32 1736233607, ; 272: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 327
	i32 1743415430, ; 273: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 305
	i32 1744735666, ; 274: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 275: System.IO.Pipelines.dll => 0x68139a0d => 220
	i32 1746316138, ; 276: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 277: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 278: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 279: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 177
	i32 1763938596, ; 280: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 281: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 282: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 282
	i32 1770582343, ; 283: Microsoft.Extensions.Logging.dll => 0x6988f147 => 203
	i32 1776026572, ; 284: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 285: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 286: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 287: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 321
	i32 1788241197, ; 288: Xamarin.AndroidX.Fragment => 0x6a96652d => 253
	i32 1793755602, ; 289: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 313
	i32 1808609942, ; 290: Xamarin.AndroidX.Loader => 0x6bcd3296 => 267
	i32 1813058853, ; 291: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 298
	i32 1813201214, ; 292: Xamarin.Google.Android.Material => 0x6c13413e => 292
	i32 1818569960, ; 293: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 272
	i32 1818787751, ; 294: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 295: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 296: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 297: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 204
	i32 1842015223, ; 298: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 333
	i32 1847515442, ; 299: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 222
	i32 1853025655, ; 300: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 330
	i32 1858542181, ; 301: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 302: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 303: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 312
	i32 1879696579, ; 304: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 305: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 233
	i32 1886040351, ; 306: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 185
	i32 1888955245, ; 307: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 308: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 309: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 310: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 311: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 312: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 313: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 314: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 279
	i32 1968388702, ; 315: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 188
	i32 1983156543, ; 316: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 299
	i32 1985761444, ; 317: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 224
	i32 2003115576, ; 318: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 309
	i32 2011961780, ; 319: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 320: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 185
	i32 2019465201, ; 321: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 264
	i32 2025202353, ; 322: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 304
	i32 2031763787, ; 323: Xamarin.Android.Glide => 0x791a414b => 221
	i32 2045470958, ; 324: System.Private.Xml => 0x79eb68ee => 88
	i32 2046047364, ; 325: ExpenseTracker.Infrastructure.dll => 0x79f43484 => 340
	i32 2048278909, ; 326: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 190
	i32 2055257422, ; 327: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 259
	i32 2060060697, ; 328: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 329: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 308
	i32 2070888862, ; 330: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 331: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 199
	i32 2079903147, ; 332: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 333: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 334: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 219
	i32 2127167465, ; 335: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 336: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 337: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 338: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 339: Microsoft.Maui => 0x80bd55ad => 212
	i32 2169148018, ; 340: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 316
	i32 2181898931, ; 341: Microsoft.Extensions.Options.dll => 0x820d22b3 => 206
	i32 2192057212, ; 342: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 204
	i32 2193016926, ; 343: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 344: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 195
	i32 2201107256, ; 345: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 303
	i32 2201231467, ; 346: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 347: it\Microsoft.Maui.Controls.resources => 0x839595db => 318
	i32 2217644978, ; 348: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 286
	i32 2222056684, ; 349: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2225750339, ; 350: ExpenseTracker.Domain.dll => 0x84aa4143 => 339
	i32 2244775296, ; 351: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 268
	i32 2252106437, ; 352: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 353: Microsoft.EntityFrameworkCore => 0x86487ec9 => 182
	i32 2256313426, ; 354: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 355: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 356: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 189
	i32 2267999099, ; 357: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 223
	i32 2270573516, ; 358: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 312
	i32 2279755925, ; 359: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 275
	i32 2293034957, ; 360: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 361: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 362: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 363: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 322
	i32 2305521784, ; 364: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 365: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 227
	i32 2320631194, ; 366: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 367: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 368: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 369: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 370: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 371: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 188
	i32 2378619854, ; 372: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 373: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 374: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 317
	i32 2401565422, ; 375: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 376: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 250
	i32 2411328690, ; 377: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 175
	i32 2421380589, ; 378: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 379: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 237
	i32 2427813419, ; 380: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 314
	i32 2435356389, ; 381: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 382: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 383: Microsoft.JSInterop.dll => 0x919672ca => 208
	i32 2454642406, ; 384: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 385: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 386: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 387: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 216
	i32 2465532216, ; 388: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 240
	i32 2471841756, ; 389: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 390: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 391: Microsoft.Maui.Controls => 0x93dba8a1 => 210
	i32 2483903535, ; 392: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 393: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 394: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 395: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 396: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 262
	i32 2522472828, ; 397: Xamarin.Android.Glide.dll => 0x9659e17c => 221
	i32 2537015816, ; 398: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 174
	i32 2538310050, ; 399: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 400: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 315
	i32 2562349572, ; 401: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 402: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 403: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 263
	i32 2581819634, ; 404: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 285
	i32 2585220780, ; 405: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 406: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 407: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 176
	i32 2589602615, ; 408: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 409: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 196
	i32 2593496499, ; 410: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 324
	i32 2605712449, ; 411: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 303
	i32 2615233544, ; 412: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 254
	i32 2616218305, ; 413: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 205
	i32 2617129537, ; 414: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 415: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 416: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 244
	i32 2624644809, ; 417: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 249
	i32 2626831493, ; 418: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 319
	i32 2627185994, ; 419: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 420: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 421: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 258
	i32 2634653062, ; 422: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 184
	i32 2638859495, ; 423: ExpenseTracker.Infrastructure => 0x9d49cce7 => 340
	i32 2663391936, ; 424: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 223
	i32 2663698177, ; 425: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 426: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 427: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 428: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 429: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 430: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 178
	i32 2693849962, ; 431: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 432: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 283
	i32 2715334215, ; 433: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 434: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 435: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 436: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 437: Xamarin.AndroidX.Activity => 0xa2e0939b => 225
	i32 2735172069, ; 438: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 439: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 174
	i32 2737747696, ; 440: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 231
	i32 2740948882, ; 441: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 442: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 443: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 325
	i32 2758225723, ; 444: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 211
	i32 2764765095, ; 445: Microsoft.Maui.dll => 0xa4caf7a7 => 212
	i32 2765824710, ; 446: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 447: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 297
	i32 2778768386, ; 448: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 288
	i32 2779977773, ; 449: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 276
	i32 2785988530, ; 450: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 331
	i32 2788224221, ; 451: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 254
	i32 2801831435, ; 452: Microsoft.Maui.Graphics => 0xa7008e0b => 214
	i32 2803228030, ; 453: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 454: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 310
	i32 2810250172, ; 455: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 241
	i32 2819470561, ; 456: System.Xml.dll => 0xa80db4e1 => 163
	i32 2820942282, ; 457: MudBlazor.dll => 0xa82429ca => 215
	i32 2821205001, ; 458: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 459: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 276
	i32 2824502124, ; 460: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 461: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 323
	i32 2833784645, ; 462: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 180
	i32 2838993487, ; 463: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 265
	i32 2847789619, ; 464: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 184
	i32 2849599387, ; 465: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 466: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 288
	i32 2855708567, ; 467: Xamarin.AndroidX.Transition => 0xaa36a797 => 284
	i32 2861098320, ; 468: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 469: Microsoft.Maui.Essentials => 0xaa8a4878 => 213
	i32 2870099610, ; 470: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 226
	i32 2875164099, ; 471: Jsr305Binding.dll => 0xab5f85c3 => 293
	i32 2875220617, ; 472: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 473: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 252
	i32 2887636118, ; 474: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 475: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 177
	i32 2899753641, ; 476: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 477: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 478: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 479: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 480: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 481: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 199
	i32 2916838712, ; 482: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 289
	i32 2919462931, ; 483: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 484: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 228
	i32 2936416060, ; 485: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 486: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 487: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 488: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 489: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 490: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 491: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 248
	i32 2987532451, ; 492: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 279
	i32 2996846495, ; 493: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 261
	i32 3016983068, ; 494: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 281
	i32 3023353419, ; 495: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 496: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 256
	i32 3038032645, ; 497: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 341
	i32 3056245963, ; 498: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 278
	i32 3057625584, ; 499: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 269
	i32 3059408633, ; 500: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 501: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3060069052, ; 502: MudBlazor => 0xb664f2bc => 215
	i32 3069363400, ; 503: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 186
	i32 3075834255, ; 504: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 505: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 316
	i32 3090735792, ; 506: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 507: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 508: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 509: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 510: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 511: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 512: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 513: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 514: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 515: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 516: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 517: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 270
	i32 3192346100, ; 518: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 519: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 520: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 186
	i32 3204380047, ; 521: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 522: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 523: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 247
	i32 3220365878, ; 524: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 525: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 526: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 527: Xamarin.AndroidX.CardView => 0xc235e84d => 235
	i32 3265493905, ; 528: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 529: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 530: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 531: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 532: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 533: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 534: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 535: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 536: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 311
	i32 3316684772, ; 537: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 538: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 245
	i32 3317144872, ; 539: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 540: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 233
	i32 3345895724, ; 541: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 274
	i32 3346324047, ; 542: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 271
	i32 3357674450, ; 543: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 328
	i32 3358260929, ; 544: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 545: SQLitePCLRaw.core => 0xc849ca45 => 217
	i32 3362336904, ; 546: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 226
	i32 3362522851, ; 547: Xamarin.AndroidX.Core => 0xc86c06e3 => 242
	i32 3366347497, ; 548: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 549: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 275
	i32 3381016424, ; 550: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 307
	i32 3395150330, ; 551: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 552: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 553: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 246
	i32 3406629867, ; 554: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 197
	i32 3421170118, ; 555: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 190
	i32 3428513518, ; 556: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 193
	i32 3429136800, ; 557: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 558: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 559: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 249
	i32 3445260447, ; 560: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 561: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 209
	i32 3463511458, ; 562: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 315
	i32 3464190856, ; 563: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 176
	i32 3471940407, ; 564: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 565: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 566: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 328
	i32 3484440000, ; 567: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 327
	i32 3485117614, ; 568: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 569: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 570: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 238
	i32 3500000672, ; 571: Microsoft.JSInterop => 0xd09dc5a0 => 208
	i32 3509114376, ; 572: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 573: System.Security.dll => 0xd1854eb4 => 130
	i32 3518210481, ; 574: ExpenseTracker.Application => 0xd1b3a1b1 => 338
	i32 3530912306, ; 575: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 576: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 577: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 578: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 579: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 335
	i32 3592435036, ; 580: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 202
	i32 3597029428, ; 581: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 224
	i32 3598340787, ; 582: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 583: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 584: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 585: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 273
	i32 3633644679, ; 586: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 228
	i32 3638274909, ; 587: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 588: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 259
	i32 3643446276, ; 589: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 332
	i32 3643854240, ; 590: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 270
	i32 3645089577, ; 591: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 592: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 189
	i32 3660523487, ; 593: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 594: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 595: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 234
	i32 3684561358, ; 596: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 238
	i32 3697841164, ; 597: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 337
	i32 3700866549, ; 598: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 599: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 243
	i32 3710998458, ; 600: ExpenseTracker.Application.dll => 0xdd3157ba => 338
	i32 3716563718, ; 601: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3717256585, ; 602: ExpenseTracker.Domain => 0xdd90d589 => 339
	i32 3718780102, ; 603: Xamarin.AndroidX.Annotation => 0xdda814c6 => 227
	i32 3722202641, ; 604: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 192
	i32 3724971120, ; 605: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 269
	i32 3732100267, ; 606: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 607: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 180
	i32 3737834244, ; 608: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 609: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 610: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 611: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 219
	i32 3758424670, ; 612: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 191
	i32 3776403777, ; 613: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 202
	i32 3786282454, ; 614: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 236
	i32 3792276235, ; 615: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 616: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 209
	i32 3802395368, ; 617: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 618: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 619: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 620: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 621: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 194
	i32 3844307129, ; 622: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 623: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 624: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 625: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 626: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 627: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 628: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 284
	i32 3888767677, ; 629: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 274
	i32 3889960447, ; 630: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 336
	i32 3896106733, ; 631: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 632: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 242
	i32 3898971068, ; 633: Microsoft.Extensions.Localization.dll => 0xe86593bc => 201
	i32 3901907137, ; 634: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 635: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 636: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 287
	i32 3928044579, ; 637: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 638: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 639: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 272
	i32 3945713374, ; 640: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 641: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3954195687, ; 642: Microsoft.Extensions.Localization => 0xebb03ce7 => 201
	i32 3955647286, ; 643: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 230
	i32 3959773229, ; 644: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 261
	i32 3980434154, ; 645: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 331
	i32 3987592930, ; 646: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 313
	i32 4003436829, ; 647: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 648: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 229
	i32 4023392905, ; 649: System.IO.Pipelines => 0xefd01a89 => 220
	i32 4025784931, ; 650: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 651: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 211
	i32 4054681211, ; 652: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 653: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 654: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 655: Microsoft.Maui.Essentials.dll => 0xf40add04 => 213
	i32 4099507663, ; 656: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 657: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 658: Xamarin.AndroidX.Emoji2 => 0xf479582c => 250
	i32 4101842092, ; 659: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 187
	i32 4102112229, ; 660: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 326
	i32 4125707920, ; 661: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 321
	i32 4126470640, ; 662: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 193
	i32 4127667938, ; 663: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 664: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 665: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 666: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 333
	i32 4151237749, ; 667: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 668: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 669: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 670: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 671: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 672: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 266
	i32 4185676441, ; 673: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 674: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 675: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 676: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 243
	i32 4258378803, ; 677: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 265
	i32 4260525087, ; 678: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 679: Microsoft.Maui.Controls.dll => 0xfea12dee => 210
	i32 4274976490, ; 680: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 681: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 266
	i32 4294648842, ; 682: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 198
	i32 4294763496 ; 683: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 252
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [684 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 195, ; 3
	i32 262, ; 4
	i32 296, ; 5
	i32 48, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 337, ; 10
	i32 124, ; 11
	i32 214, ; 12
	i32 102, ; 13
	i32 280, ; 14
	i32 107, ; 15
	i32 280, ; 16
	i32 139, ; 17
	i32 300, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 0, ; 21
	i32 13, ; 22
	i32 236, ; 23
	i32 132, ; 24
	i32 282, ; 25
	i32 151, ; 26
	i32 334, ; 27
	i32 335, ; 28
	i32 18, ; 29
	i32 234, ; 30
	i32 26, ; 31
	i32 256, ; 32
	i32 1, ; 33
	i32 59, ; 34
	i32 42, ; 35
	i32 91, ; 36
	i32 175, ; 37
	i32 239, ; 38
	i32 147, ; 39
	i32 258, ; 40
	i32 255, ; 41
	i32 306, ; 42
	i32 54, ; 43
	i32 69, ; 44
	i32 334, ; 45
	i32 225, ; 46
	i32 83, ; 47
	i32 319, ; 48
	i32 257, ; 49
	i32 218, ; 50
	i32 318, ; 51
	i32 131, ; 52
	i32 55, ; 53
	i32 149, ; 54
	i32 74, ; 55
	i32 145, ; 56
	i32 62, ; 57
	i32 146, ; 58
	i32 341, ; 59
	i32 165, ; 60
	i32 330, ; 61
	i32 240, ; 62
	i32 12, ; 63
	i32 253, ; 64
	i32 125, ; 65
	i32 152, ; 66
	i32 113, ; 67
	i32 166, ; 68
	i32 164, ; 69
	i32 255, ; 70
	i32 268, ; 71
	i32 84, ; 72
	i32 317, ; 73
	i32 311, ; 74
	i32 207, ; 75
	i32 150, ; 76
	i32 300, ; 77
	i32 60, ; 78
	i32 203, ; 79
	i32 51, ; 80
	i32 103, ; 81
	i32 114, ; 82
	i32 40, ; 83
	i32 293, ; 84
	i32 291, ; 85
	i32 198, ; 86
	i32 120, ; 87
	i32 325, ; 88
	i32 52, ; 89
	i32 0, ; 90
	i32 44, ; 91
	i32 119, ; 92
	i32 245, ; 93
	i32 323, ; 94
	i32 251, ; 95
	i32 81, ; 96
	i32 136, ; 97
	i32 287, ; 98
	i32 232, ; 99
	i32 8, ; 100
	i32 73, ; 101
	i32 305, ; 102
	i32 155, ; 103
	i32 302, ; 104
	i32 154, ; 105
	i32 92, ; 106
	i32 297, ; 107
	i32 45, ; 108
	i32 320, ; 109
	i32 308, ; 110
	i32 301, ; 111
	i32 109, ; 112
	i32 129, ; 113
	i32 216, ; 114
	i32 25, ; 115
	i32 222, ; 116
	i32 72, ; 117
	i32 55, ; 118
	i32 46, ; 119
	i32 329, ; 120
	i32 206, ; 121
	i32 246, ; 122
	i32 179, ; 123
	i32 22, ; 124
	i32 260, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 71, ; 129
	i32 273, ; 130
	i32 3, ; 131
	i32 42, ; 132
	i32 63, ; 133
	i32 16, ; 134
	i32 53, ; 135
	i32 332, ; 136
	i32 296, ; 137
	i32 105, ; 138
	i32 301, ; 139
	i32 294, ; 140
	i32 257, ; 141
	i32 34, ; 142
	i32 158, ; 143
	i32 85, ; 144
	i32 32, ; 145
	i32 12, ; 146
	i32 51, ; 147
	i32 200, ; 148
	i32 56, ; 149
	i32 277, ; 150
	i32 36, ; 151
	i32 194, ; 152
	i32 307, ; 153
	i32 295, ; 154
	i32 230, ; 155
	i32 35, ; 156
	i32 58, ; 157
	i32 264, ; 158
	i32 173, ; 159
	i32 17, ; 160
	i32 298, ; 161
	i32 164, ; 162
	i32 191, ; 163
	i32 320, ; 164
	i32 263, ; 165
	i32 205, ; 166
	i32 290, ; 167
	i32 183, ; 168
	i32 326, ; 169
	i32 153, ; 170
	i32 196, ; 171
	i32 286, ; 172
	i32 271, ; 173
	i32 183, ; 174
	i32 324, ; 175
	i32 232, ; 176
	i32 187, ; 177
	i32 29, ; 178
	i32 52, ; 179
	i32 322, ; 180
	i32 291, ; 181
	i32 5, ; 182
	i32 306, ; 183
	i32 281, ; 184
	i32 285, ; 185
	i32 237, ; 186
	i32 302, ; 187
	i32 229, ; 188
	i32 217, ; 189
	i32 248, ; 190
	i32 85, ; 191
	i32 290, ; 192
	i32 61, ; 193
	i32 112, ; 194
	i32 57, ; 195
	i32 336, ; 196
	i32 277, ; 197
	i32 99, ; 198
	i32 19, ; 199
	i32 241, ; 200
	i32 111, ; 201
	i32 101, ; 202
	i32 102, ; 203
	i32 304, ; 204
	i32 104, ; 205
	i32 294, ; 206
	i32 71, ; 207
	i32 38, ; 208
	i32 32, ; 209
	i32 197, ; 210
	i32 103, ; 211
	i32 73, ; 212
	i32 310, ; 213
	i32 9, ; 214
	i32 123, ; 215
	i32 46, ; 216
	i32 231, ; 217
	i32 207, ; 218
	i32 9, ; 219
	i32 43, ; 220
	i32 4, ; 221
	i32 278, ; 222
	i32 181, ; 223
	i32 314, ; 224
	i32 309, ; 225
	i32 200, ; 226
	i32 31, ; 227
	i32 138, ; 228
	i32 92, ; 229
	i32 179, ; 230
	i32 93, ; 231
	i32 329, ; 232
	i32 49, ; 233
	i32 141, ; 234
	i32 112, ; 235
	i32 140, ; 236
	i32 247, ; 237
	i32 115, ; 238
	i32 295, ; 239
	i32 157, ; 240
	i32 76, ; 241
	i32 79, ; 242
	i32 267, ; 243
	i32 37, ; 244
	i32 289, ; 245
	i32 192, ; 246
	i32 251, ; 247
	i32 244, ; 248
	i32 64, ; 249
	i32 138, ; 250
	i32 15, ; 251
	i32 178, ; 252
	i32 116, ; 253
	i32 283, ; 254
	i32 292, ; 255
	i32 239, ; 256
	i32 48, ; 257
	i32 70, ; 258
	i32 80, ; 259
	i32 126, ; 260
	i32 181, ; 261
	i32 182, ; 262
	i32 94, ; 263
	i32 121, ; 264
	i32 299, ; 265
	i32 26, ; 266
	i32 218, ; 267
	i32 260, ; 268
	i32 97, ; 269
	i32 28, ; 270
	i32 235, ; 271
	i32 327, ; 272
	i32 305, ; 273
	i32 149, ; 274
	i32 220, ; 275
	i32 169, ; 276
	i32 4, ; 277
	i32 98, ; 278
	i32 177, ; 279
	i32 33, ; 280
	i32 93, ; 281
	i32 282, ; 282
	i32 203, ; 283
	i32 21, ; 284
	i32 41, ; 285
	i32 170, ; 286
	i32 321, ; 287
	i32 253, ; 288
	i32 313, ; 289
	i32 267, ; 290
	i32 298, ; 291
	i32 292, ; 292
	i32 272, ; 293
	i32 2, ; 294
	i32 134, ; 295
	i32 111, ; 296
	i32 204, ; 297
	i32 333, ; 298
	i32 222, ; 299
	i32 330, ; 300
	i32 58, ; 301
	i32 95, ; 302
	i32 312, ; 303
	i32 39, ; 304
	i32 233, ; 305
	i32 185, ; 306
	i32 25, ; 307
	i32 94, ; 308
	i32 89, ; 309
	i32 99, ; 310
	i32 10, ; 311
	i32 87, ; 312
	i32 100, ; 313
	i32 279, ; 314
	i32 188, ; 315
	i32 299, ; 316
	i32 224, ; 317
	i32 309, ; 318
	i32 7, ; 319
	i32 185, ; 320
	i32 264, ; 321
	i32 304, ; 322
	i32 221, ; 323
	i32 88, ; 324
	i32 340, ; 325
	i32 190, ; 326
	i32 259, ; 327
	i32 154, ; 328
	i32 308, ; 329
	i32 33, ; 330
	i32 199, ; 331
	i32 116, ; 332
	i32 82, ; 333
	i32 219, ; 334
	i32 20, ; 335
	i32 11, ; 336
	i32 162, ; 337
	i32 3, ; 338
	i32 212, ; 339
	i32 316, ; 340
	i32 206, ; 341
	i32 204, ; 342
	i32 84, ; 343
	i32 195, ; 344
	i32 303, ; 345
	i32 64, ; 346
	i32 318, ; 347
	i32 286, ; 348
	i32 143, ; 349
	i32 339, ; 350
	i32 268, ; 351
	i32 157, ; 352
	i32 182, ; 353
	i32 41, ; 354
	i32 117, ; 355
	i32 189, ; 356
	i32 223, ; 357
	i32 312, ; 358
	i32 275, ; 359
	i32 131, ; 360
	i32 75, ; 361
	i32 66, ; 362
	i32 322, ; 363
	i32 172, ; 364
	i32 227, ; 365
	i32 143, ; 366
	i32 106, ; 367
	i32 151, ; 368
	i32 70, ; 369
	i32 156, ; 370
	i32 188, ; 371
	i32 121, ; 372
	i32 127, ; 373
	i32 317, ; 374
	i32 152, ; 375
	i32 250, ; 376
	i32 175, ; 377
	i32 141, ; 378
	i32 237, ; 379
	i32 314, ; 380
	i32 20, ; 381
	i32 14, ; 382
	i32 208, ; 383
	i32 135, ; 384
	i32 75, ; 385
	i32 59, ; 386
	i32 216, ; 387
	i32 240, ; 388
	i32 167, ; 389
	i32 168, ; 390
	i32 210, ; 391
	i32 15, ; 392
	i32 74, ; 393
	i32 6, ; 394
	i32 23, ; 395
	i32 262, ; 396
	i32 221, ; 397
	i32 174, ; 398
	i32 91, ; 399
	i32 315, ; 400
	i32 1, ; 401
	i32 136, ; 402
	i32 263, ; 403
	i32 285, ; 404
	i32 134, ; 405
	i32 69, ; 406
	i32 176, ; 407
	i32 146, ; 408
	i32 196, ; 409
	i32 324, ; 410
	i32 303, ; 411
	i32 254, ; 412
	i32 205, ; 413
	i32 88, ; 414
	i32 96, ; 415
	i32 244, ; 416
	i32 249, ; 417
	i32 319, ; 418
	i32 31, ; 419
	i32 45, ; 420
	i32 258, ; 421
	i32 184, ; 422
	i32 340, ; 423
	i32 223, ; 424
	i32 109, ; 425
	i32 158, ; 426
	i32 35, ; 427
	i32 22, ; 428
	i32 114, ; 429
	i32 178, ; 430
	i32 57, ; 431
	i32 283, ; 432
	i32 144, ; 433
	i32 118, ; 434
	i32 120, ; 435
	i32 110, ; 436
	i32 225, ; 437
	i32 139, ; 438
	i32 174, ; 439
	i32 231, ; 440
	i32 54, ; 441
	i32 105, ; 442
	i32 325, ; 443
	i32 211, ; 444
	i32 212, ; 445
	i32 133, ; 446
	i32 297, ; 447
	i32 288, ; 448
	i32 276, ; 449
	i32 331, ; 450
	i32 254, ; 451
	i32 214, ; 452
	i32 159, ; 453
	i32 310, ; 454
	i32 241, ; 455
	i32 163, ; 456
	i32 215, ; 457
	i32 132, ; 458
	i32 276, ; 459
	i32 161, ; 460
	i32 323, ; 461
	i32 180, ; 462
	i32 265, ; 463
	i32 184, ; 464
	i32 140, ; 465
	i32 288, ; 466
	i32 284, ; 467
	i32 169, ; 468
	i32 213, ; 469
	i32 226, ; 470
	i32 293, ; 471
	i32 40, ; 472
	i32 252, ; 473
	i32 81, ; 474
	i32 177, ; 475
	i32 56, ; 476
	i32 37, ; 477
	i32 97, ; 478
	i32 166, ; 479
	i32 172, ; 480
	i32 199, ; 481
	i32 289, ; 482
	i32 82, ; 483
	i32 228, ; 484
	i32 98, ; 485
	i32 30, ; 486
	i32 159, ; 487
	i32 18, ; 488
	i32 127, ; 489
	i32 119, ; 490
	i32 248, ; 491
	i32 279, ; 492
	i32 261, ; 493
	i32 281, ; 494
	i32 165, ; 495
	i32 256, ; 496
	i32 341, ; 497
	i32 278, ; 498
	i32 269, ; 499
	i32 170, ; 500
	i32 16, ; 501
	i32 215, ; 502
	i32 186, ; 503
	i32 144, ; 504
	i32 316, ; 505
	i32 125, ; 506
	i32 118, ; 507
	i32 38, ; 508
	i32 115, ; 509
	i32 47, ; 510
	i32 142, ; 511
	i32 117, ; 512
	i32 34, ; 513
	i32 173, ; 514
	i32 95, ; 515
	i32 53, ; 516
	i32 270, ; 517
	i32 129, ; 518
	i32 153, ; 519
	i32 186, ; 520
	i32 24, ; 521
	i32 161, ; 522
	i32 247, ; 523
	i32 148, ; 524
	i32 104, ; 525
	i32 89, ; 526
	i32 235, ; 527
	i32 60, ; 528
	i32 142, ; 529
	i32 100, ; 530
	i32 5, ; 531
	i32 13, ; 532
	i32 122, ; 533
	i32 135, ; 534
	i32 28, ; 535
	i32 311, ; 536
	i32 72, ; 537
	i32 245, ; 538
	i32 24, ; 539
	i32 233, ; 540
	i32 274, ; 541
	i32 271, ; 542
	i32 328, ; 543
	i32 137, ; 544
	i32 217, ; 545
	i32 226, ; 546
	i32 242, ; 547
	i32 168, ; 548
	i32 275, ; 549
	i32 307, ; 550
	i32 101, ; 551
	i32 123, ; 552
	i32 246, ; 553
	i32 197, ; 554
	i32 190, ; 555
	i32 193, ; 556
	i32 163, ; 557
	i32 167, ; 558
	i32 249, ; 559
	i32 39, ; 560
	i32 209, ; 561
	i32 315, ; 562
	i32 176, ; 563
	i32 17, ; 564
	i32 171, ; 565
	i32 328, ; 566
	i32 327, ; 567
	i32 137, ; 568
	i32 150, ; 569
	i32 238, ; 570
	i32 208, ; 571
	i32 155, ; 572
	i32 130, ; 573
	i32 338, ; 574
	i32 19, ; 575
	i32 65, ; 576
	i32 147, ; 577
	i32 47, ; 578
	i32 335, ; 579
	i32 202, ; 580
	i32 224, ; 581
	i32 79, ; 582
	i32 61, ; 583
	i32 106, ; 584
	i32 273, ; 585
	i32 228, ; 586
	i32 49, ; 587
	i32 259, ; 588
	i32 332, ; 589
	i32 270, ; 590
	i32 14, ; 591
	i32 189, ; 592
	i32 68, ; 593
	i32 171, ; 594
	i32 234, ; 595
	i32 238, ; 596
	i32 337, ; 597
	i32 78, ; 598
	i32 243, ; 599
	i32 338, ; 600
	i32 108, ; 601
	i32 339, ; 602
	i32 227, ; 603
	i32 192, ; 604
	i32 269, ; 605
	i32 67, ; 606
	i32 180, ; 607
	i32 63, ; 608
	i32 27, ; 609
	i32 160, ; 610
	i32 219, ; 611
	i32 191, ; 612
	i32 202, ; 613
	i32 236, ; 614
	i32 10, ; 615
	i32 209, ; 616
	i32 11, ; 617
	i32 78, ; 618
	i32 126, ; 619
	i32 83, ; 620
	i32 194, ; 621
	i32 66, ; 622
	i32 107, ; 623
	i32 65, ; 624
	i32 128, ; 625
	i32 122, ; 626
	i32 77, ; 627
	i32 284, ; 628
	i32 274, ; 629
	i32 336, ; 630
	i32 8, ; 631
	i32 242, ; 632
	i32 201, ; 633
	i32 2, ; 634
	i32 44, ; 635
	i32 287, ; 636
	i32 156, ; 637
	i32 128, ; 638
	i32 272, ; 639
	i32 23, ; 640
	i32 133, ; 641
	i32 201, ; 642
	i32 230, ; 643
	i32 261, ; 644
	i32 331, ; 645
	i32 313, ; 646
	i32 29, ; 647
	i32 229, ; 648
	i32 220, ; 649
	i32 62, ; 650
	i32 211, ; 651
	i32 90, ; 652
	i32 87, ; 653
	i32 148, ; 654
	i32 213, ; 655
	i32 36, ; 656
	i32 86, ; 657
	i32 250, ; 658
	i32 187, ; 659
	i32 326, ; 660
	i32 321, ; 661
	i32 193, ; 662
	i32 50, ; 663
	i32 6, ; 664
	i32 90, ; 665
	i32 333, ; 666
	i32 21, ; 667
	i32 162, ; 668
	i32 96, ; 669
	i32 50, ; 670
	i32 113, ; 671
	i32 266, ; 672
	i32 130, ; 673
	i32 76, ; 674
	i32 27, ; 675
	i32 243, ; 676
	i32 265, ; 677
	i32 7, ; 678
	i32 210, ; 679
	i32 110, ; 680
	i32 266, ; 681
	i32 198, ; 682
	i32 252 ; 683
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}

.class Lcom/android/server/BackupManagerService$PerformFullBackupTask;
.super Lcom/android/server/BackupManagerService$ObbServiceClient;
.source "BackupManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PerformFullBackupTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;
    }
.end annotation


# instance fields
.field mAllApps:Z

.field mCurrentPassword:Ljava/lang/String;

.field mDeflater:Ljava/util/zip/DeflaterOutputStream;

.field mDomainTokens:[Ljava/lang/String;

.field mEncryptPassword:Ljava/lang/String;

.field mExcludeFilesRegex:Ljava/lang/String;

.field mFilesDir:Ljava/io/File;

.field mIgnoreEncryptionPasswordCheck:Z

.field mIncludeApks:Z

.field mIncludeObbs:Z

.field mIncludeShared:Z

.field final mIncludeSystem:Z

.field mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

.field mManifestFile:Ljava/io/File;

.field mNoninteractive:Z

.field mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

.field mOutputFile:Landroid/os/ParcelFileDescriptor;

.field mPackages:[Ljava/lang/String;

.field mShouldKillAfterBackup:Z

.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/BackupManagerService;Landroid/os/ParcelFileDescriptor;Landroid/app/backup/IFullBackupRestoreObserver;ZZZLjava/lang/String;Ljava/lang/String;ZZ[Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 4
    .parameter
    .parameter "fd"
    .parameter "observer"
    .parameter "includeApks"
    .parameter "includeObbs"
    .parameter "includeShared"
    .parameter "curPassword"
    .parameter "encryptPassword"
    .parameter "doAllApps"
    .parameter "doSystem"
    .parameter "packages"
    .parameter "latch"
    .parameter "domainTokens"
    .parameter "excludeFilesRegex"
    .parameter "shouldKillAfterBackup"
    .parameter "noninteractive"
    .parameter "ignoreEncryptionPasswordCheck"

    .prologue
    .line 2736
    iput-object p1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct {p0, p1}, Lcom/android/server/BackupManagerService$ObbServiceClient;-><init>(Lcom/android/server/BackupManagerService;)V

    .line 2737
    iput-object p2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    .line 2738
    iput-object p3, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    .line 2739
    iput-boolean p4, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeApks:Z

    .line 2740
    iput-boolean p5, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeObbs:Z

    .line 2741
    iput-boolean p6, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeShared:Z

    .line 2742
    iput-boolean p9, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mAllApps:Z

    .line 2743
    iput-boolean p10, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeSystem:Z

    .line 2744
    iput-object p11, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mPackages:[Ljava/lang/String;

    .line 2745
    iput-object p7, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mCurrentPassword:Ljava/lang/String;

    .line 2750
    if-eqz p8, :cond_0

    const-string v1, ""

    invoke-virtual {v1, p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2751
    :cond_0
    iput-object p7, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mEncryptPassword:Ljava/lang/String;

    .line 2755
    :goto_0
    move/from16 v0, p17

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIgnoreEncryptionPasswordCheck:Z

    .line 2756
    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2758
    new-instance v1, Ljava/io/File;

    const-string v2, "/data/system"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mFilesDir:Ljava/io/File;

    .line 2759
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mFilesDir:Ljava/io/File;

    const-string v3, "_manifest"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mManifestFile:Ljava/io/File;

    .line 2760
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mDomainTokens:[Ljava/lang/String;

    .line 2761
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mExcludeFilesRegex:Ljava/lang/String;

    .line 2762
    move/from16 v0, p15

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    .line 2763
    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mNoninteractive:Z

    .line 2764
    return-void

    .line 2753
    :cond_1
    iput-object p8, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mEncryptPassword:Ljava/lang/String;

    goto :goto_0
.end method

.method static synthetic access$1100(Lcom/android/server/BackupManagerService$PerformFullBackupTask;Landroid/content/pm/PackageInfo;Ljava/io/File;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2652
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->writeAppManifest(Landroid/content/pm/PackageInfo;Ljava/io/File;Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/server/BackupManagerService$PerformFullBackupTask;Landroid/content/pm/PackageInfo;Landroid/app/backup/BackupDataOutput;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 2652
    invoke-direct {p0, p1, p2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->writeApkToBackup(Landroid/content/pm/PackageInfo;Landroid/app/backup/BackupDataOutput;)V

    return-void
.end method

.method private backupOnePackage(Landroid/content/pm/PackageInfo;Ljava/io/OutputStream;Z)V
    .locals 14
    .parameter "pkg"
    .parameter "out"
    .parameter "shouldKillAfterBackup"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/util/concurrent/TimeoutException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3045
    const-string v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Binding to full backup agent : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3047
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v5}, Lcom/android/server/BackupManagerService;->bindToAgentSynchronous(Landroid/content/pm/ApplicationInfo;I)Landroid/app/IBackupAgent;

    move-result-object v4

    .line 3049
    .local v4, agent:Landroid/app/IBackupAgent;
    if-eqz v4, :cond_9

    .line 3050
    const/4 v12, 0x0

    .line 3052
    .local v12, pipes:[Landroid/os/ParcelFileDescriptor;
    :try_start_0
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v12

    .line 3054
    iget-object v9, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 3055
    .local v9, app:Landroid/content/pm/ApplicationInfo;
    iget-object v2, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v3, "com.android.sharedstoragebackup"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    .line 3056
    .local v11, isSharedStorage:Z
    iget-boolean v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeApks:Z

    if-eqz v2, :cond_3

    if-nez v11, :cond_3

    iget v2, v9, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x2000

    and-int/2addr v2, v3

    if-nez v2, :cond_3

    iget v2, v9, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    iget v2, v9, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_3

    :cond_0
    const/4 v7, 0x1

    .line 3062
    .local v7, sendApk:Z
    :goto_0
    if-eqz v11, :cond_4

    const-string v2, "Shared storage"

    :goto_1
    invoke-virtual {p0, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendOnBackupPackage(Ljava/lang/String;)V

    .line 3064
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v2}, Lcom/android/server/BackupManagerService;->generateToken()I

    move-result v6

    .line 3065
    .local v6, token:I
    new-instance v1, Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;

    const/4 v2, 0x1

    aget-object v5, v12, v2

    if-nez v11, :cond_5

    const/4 v8, 0x1

    :goto_2
    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;-><init>(Lcom/android/server/BackupManagerService$PerformFullBackupTask;Landroid/content/pm/PackageInfo;Landroid/app/IBackupAgent;Landroid/os/ParcelFileDescriptor;IZZ)V

    .line 3067
    .local v1, runner:Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;
    const/4 v2, 0x1

    aget-object v2, v12, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 3068
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v12, v2

    .line 3069
    new-instance v13, Ljava/lang/Thread;

    invoke-direct {v13, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 3070
    .local v13, t:Ljava/lang/Thread;
    invoke-virtual {v13}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3074
    :try_start_1
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v3, 0x0

    aget-object v3, v12, v3

    move-object/from16 v0, p2

    #calls: Lcom/android/server/BackupManagerService;->routeSocketDataToOutput(Landroid/os/ParcelFileDescriptor;Ljava/io/OutputStream;)V
    invoke-static {v2, v3, v0}, Lcom/android/server/BackupManagerService;->access$1000(Lcom/android/server/BackupManagerService;Landroid/os/ParcelFileDescriptor;Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3080
    :try_start_2
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v2, v6}, Lcom/android/server/BackupManagerService;->waitUntilOperationComplete(I)Z

    move-result v2

    if-nez v2, :cond_6

    .line 3081
    const-string v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Full backup failed on package "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3082
    new-instance v2, Ljava/util/concurrent/TimeoutException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to bind to full agent for "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 3088
    .end local v1           #runner:Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;
    .end local v6           #token:I
    .end local v7           #sendApk:Z
    .end local v9           #app:Landroid/content/pm/ApplicationInfo;
    .end local v11           #isSharedStorage:Z
    .end local v13           #t:Ljava/lang/Thread;
    :catch_0
    move-exception v10

    .line 3089
    .local v10, e:Ljava/io/IOException;
    :try_start_3
    const-string v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error backing up "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3090
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error backing up "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3092
    .end local v10           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v2

    .line 3094
    :try_start_4
    invoke-virtual/range {p2 .. p2}, Ljava/io/OutputStream;->flush()V

    .line 3095
    if-eqz v12, :cond_2

    .line 3096
    const/4 v3, 0x0

    aget-object v3, v12, v3

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    aget-object v3, v12, v3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 3097
    :cond_1
    const/4 v3, 0x1

    aget-object v3, v12, v3

    if-eqz v3, :cond_2

    const/4 v3, 0x1

    aget-object v3, v12, v3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 3092
    :cond_2
    :goto_3
    throw v2

    .line 3056
    .restart local v9       #app:Landroid/content/pm/ApplicationInfo;
    .restart local v11       #isSharedStorage:Z
    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 3062
    .restart local v7       #sendApk:Z
    :cond_4
    :try_start_5
    iget-object v2, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    goto/16 :goto_1

    .line 3065
    .restart local v6       #token:I
    :cond_5
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 3075
    .restart local v1       #runner:Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;
    .restart local v13       #t:Ljava/lang/Thread;
    :catch_1
    move-exception v10

    .line 3076
    .restart local v10       #e:Ljava/io/IOException;
    const-string v2, "BackupManagerService"

    const-string v3, "Caught exception reading from agent"

    invoke-static {v2, v3, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3077
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error backing up "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3085
    .end local v10           #e:Ljava/io/IOException;
    :cond_6
    const-string v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Full package backup success: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 3094
    :try_start_6
    invoke-virtual/range {p2 .. p2}, Ljava/io/OutputStream;->flush()V

    .line 3095
    if-eqz v12, :cond_8

    .line 3096
    const/4 v2, 0x0

    aget-object v2, v12, v2

    if-eqz v2, :cond_7

    const/4 v2, 0x0

    aget-object v2, v12, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 3097
    :cond_7
    const/4 v2, 0x1

    aget-object v2, v12, v2

    if-eqz v2, :cond_8

    const/4 v2, 0x1

    aget-object v2, v12, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 3107
    :cond_8
    :goto_4
    move/from16 v0, p3

    invoke-direct {p0, p1, v0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 3108
    return-void

    .line 3104
    .end local v1           #runner:Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;
    .end local v6           #token:I
    .end local v7           #sendApk:Z
    .end local v9           #app:Landroid/content/pm/ApplicationInfo;
    .end local v11           #isSharedStorage:Z
    .end local v12           #pipes:[Landroid/os/ParcelFileDescriptor;
    .end local v13           #t:Ljava/lang/Thread;
    :cond_9
    const-string v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to bind to full agent for "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3105
    new-instance v2, Ljava/util/concurrent/TimeoutException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to bind to full agent for "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3099
    .restart local v12       #pipes:[Landroid/os/ParcelFileDescriptor;
    :catch_2
    move-exception v10

    .line 3100
    .restart local v10       #e:Ljava/io/IOException;
    const-string v3, "BackupManagerService"

    const-string v5, "Error bringing down backup stack"

    invoke-static {v3, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 3099
    .end local v10           #e:Ljava/io/IOException;
    .restart local v1       #runner:Lcom/android/server/BackupManagerService$PerformFullBackupTask$FullBackupRunner;
    .restart local v6       #token:I
    .restart local v7       #sendApk:Z
    .restart local v9       #app:Landroid/content/pm/ApplicationInfo;
    .restart local v11       #isSharedStorage:Z
    .restart local v13       #t:Ljava/lang/Thread;
    :catch_3
    move-exception v10

    .line 3100
    .restart local v10       #e:Ljava/io/IOException;
    const-string v2, "BackupManagerService"

    const-string v3, "Error bringing down backup stack"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method private emitAesBackupHeader(Ljava/lang/StringBuilder;Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 23
    .parameter "headerbuf"
    .parameter "ofstream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2974
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    const/16 v20, 0x200

    #calls: Lcom/android/server/BackupManagerService;->randomBytes(I)[B
    invoke-static/range {v19 .. v20}, Lcom/android/server/BackupManagerService;->access$1400(Lcom/android/server/BackupManagerService;I)[B

    move-result-object v17

    .line 2975
    .local v17, newUserSalt:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    const-string v20, "PBKDF2WithHmacSHA1"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mEncryptPassword:Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x2710

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v17

    move/from16 v4, v22

    #calls: Lcom/android/server/BackupManagerService;->buildPasswordKey(Ljava/lang/String;Ljava/lang/String;[BI)Ljavax/crypto/SecretKey;
    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/BackupManagerService;->access$1500(Lcom/android/server/BackupManagerService;Ljava/lang/String;Ljava/lang/String;[BI)Ljavax/crypto/SecretKey;

    move-result-object v18

    .line 2979
    .local v18, userKey:Ljavax/crypto/SecretKey;
    const/16 v19, 0x20

    move/from16 v0, v19

    new-array v13, v0, [B

    .line 2980
    .local v13, masterPw:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    #getter for: Lcom/android/server/BackupManagerService;->mRng:Ljava/security/SecureRandom;
    invoke-static/range {v19 .. v19}, Lcom/android/server/BackupManagerService;->access$1600(Lcom/android/server/BackupManagerService;)Ljava/security/SecureRandom;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 2981
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    const/16 v20, 0x200

    #calls: Lcom/android/server/BackupManagerService;->randomBytes(I)[B
    invoke-static/range {v19 .. v20}, Lcom/android/server/BackupManagerService;->access$1400(Lcom/android/server/BackupManagerService;I)[B

    move-result-object v9

    .line 2984
    .local v9, checksumSalt:[B
    const-string v19, "AES/CBC/PKCS5Padding"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v7

    .line 2985
    .local v7, c:Ljavax/crypto/Cipher;
    new-instance v12, Ljavax/crypto/spec/SecretKeySpec;

    const-string v19, "AES"

    move-object/from16 v0, v19

    invoke-direct {v12, v13, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 2986
    .local v12, masterKeySpec:Ljavax/crypto/spec/SecretKeySpec;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v7, v0, v12}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 2987
    new-instance v11, Ljavax/crypto/CipherOutputStream;

    move-object/from16 v0, p2

    invoke-direct {v11, v0, v7}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V

    .line 2990
    .local v11, finalOutput:Ljava/io/OutputStream;
    const-string v19, "AES-256"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2991
    const/16 v19, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2993
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    #calls: Lcom/android/server/BackupManagerService;->byteArrayToHex([B)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/android/server/BackupManagerService;->access$1700(Lcom/android/server/BackupManagerService;[B)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2994
    const/16 v19, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2996
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    #calls: Lcom/android/server/BackupManagerService;->byteArrayToHex([B)Ljava/lang/String;
    invoke-static {v0, v9}, Lcom/android/server/BackupManagerService;->access$1700(Lcom/android/server/BackupManagerService;[B)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2997
    const/16 v19, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2999
    const/16 v19, 0x2710

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 3000
    const/16 v19, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3003
    const-string v19, "AES/CBC/PKCS5Padding"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v15

    .line 3004
    .local v15, mkC:Ljavax/crypto/Cipher;
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v15, v0, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 3006
    invoke-virtual {v15}, Ljavax/crypto/Cipher;->getIV()[B

    move-result-object v5

    .line 3007
    .local v5, IV:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    #calls: Lcom/android/server/BackupManagerService;->byteArrayToHex([B)Ljava/lang/String;
    invoke-static {v0, v5}, Lcom/android/server/BackupManagerService;->access$1700(Lcom/android/server/BackupManagerService;[B)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3008
    const/16 v19, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3020
    invoke-virtual {v7}, Ljavax/crypto/Cipher;->getIV()[B

    move-result-object v5

    .line 3021
    invoke-virtual {v12}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object v14

    .line 3022
    .local v14, mk:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    const-string v20, "PBKDF2WithHmacSHA1"

    invoke-virtual {v12}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object v21

    const/16 v22, 0x2710

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move/from16 v3, v22

    #calls: Lcom/android/server/BackupManagerService;->makeKeyChecksum(Ljava/lang/String;[B[BI)[B
    invoke-static {v0, v1, v2, v9, v3}, Lcom/android/server/BackupManagerService;->access$1800(Lcom/android/server/BackupManagerService;Ljava/lang/String;[B[BI)[B

    move-result-object v8

    .line 3025
    .local v8, checksum:[B
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    array-length v0, v5

    move/from16 v19, v0

    array-length v0, v14

    move/from16 v20, v0

    add-int v19, v19, v20

    array-length v0, v8

    move/from16 v20, v0

    add-int v19, v19, v20

    add-int/lit8 v19, v19, 0x3

    move/from16 v0, v19

    invoke-direct {v6, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 3027
    .local v6, blob:Ljava/io/ByteArrayOutputStream;
    new-instance v16, Ljava/io/DataOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 3028
    .local v16, mkOut:Ljava/io/DataOutputStream;
    array-length v0, v5

    move/from16 v19, v0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 3029
    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/io/DataOutputStream;->write([B)V

    .line 3030
    array-length v0, v14

    move/from16 v19, v0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 3031
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/io/DataOutputStream;->write([B)V

    .line 3032
    array-length v0, v8

    move/from16 v19, v0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 3033
    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/io/DataOutputStream;->write([B)V

    .line 3034
    invoke-virtual/range {v16 .. v16}, Ljava/io/DataOutputStream;->flush()V

    .line 3035
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v10

    .line 3036
    .local v10, encryptedMk:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    #calls: Lcom/android/server/BackupManagerService;->byteArrayToHex([B)Ljava/lang/String;
    invoke-static {v0, v10}, Lcom/android/server/BackupManagerService;->access$1700(Lcom/android/server/BackupManagerService;[B)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3037
    const/16 v19, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3039
    return-object v11
.end method

.method private finalizeBackup(Ljava/io/OutputStream;)V
    .locals 4
    .parameter "out"

    .prologue
    .line 3140
    const/16 v2, 0x400

    :try_start_0
    new-array v1, v2, [B

    .line 3141
    .local v1, eof:[B
    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3145
    .end local v1           #eof:[B
    :goto_0
    return-void

    .line 3142
    :catch_0
    move-exception v0

    .line 3143
    .local v0, e:Ljava/io/IOException;
    const-string v2, "BackupManagerService"

    const-string v3, "Error attempting to finalize backup stream"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private tearDown(Landroid/content/pm/PackageInfo;Z)V
    .locals 5
    .parameter "pkg"
    .parameter "shouldKillAfterBackup"

    .prologue
    .line 3187
    if-eqz p1, :cond_0

    .line 3188
    iget-object v0, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 3189
    .local v0, app:Landroid/content/pm/ApplicationInfo;
    if-eqz v0, :cond_0

    .line 3192
    :try_start_0
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static {v2}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/app/IActivityManager;->unbindBackupAgent(Landroid/content/pm/ApplicationInfo;)V

    .line 3195
    iget v2, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    const/16 v3, 0x3e8

    if-eq v2, v3, :cond_0

    iget v2, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    const/16 v3, 0x3e9

    if-eq v2, v3, :cond_0

    if-eqz p2, :cond_0

    .line 3198
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static {v2}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v2

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    iget v4, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-interface {v2, v3, v4}, Landroid/app/IActivityManager;->killApplicationProcess(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3207
    .end local v0           #app:Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    return-void

    .line 3202
    .restart local v0       #app:Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 3203
    .local v1, e:Landroid/os/RemoteException;
    const-string v2, "BackupManagerService"

    const-string v3, "Lost app trying to shut down"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private writeApkToBackup(Landroid/content/pm/PackageInfo;Landroid/app/backup/BackupDataOutput;)V
    .locals 19
    .parameter "pkg"
    .parameter "output"

    .prologue
    .line 3112
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 3113
    .local v5, appSourceDir:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    .line 3114
    .local v4, apkDir:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v2, "a"

    const/4 v3, 0x0

    move-object/from16 v6, p2

    invoke-static/range {v1 .. v6}, Landroid/app/backup/FullBackup;->backupToTar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/BackupDataOutput;)I

    .line 3122
    new-instance v18, Landroid/os/Environment$UserEnvironment;

    const/4 v1, 0x0

    move-object/from16 v0, v18

    invoke-direct {v0, v1}, Landroid/os/Environment$UserEnvironment;-><init>(I)V

    .line 3123
    .local v18, userEnv:Landroid/os/Environment$UserEnvironment;
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Landroid/os/Environment$UserEnvironment;->buildExternalStorageAppObbDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v16, v1, v2

    .line 3124
    .local v16, obbDir:Ljava/io/File;
    if-eqz v16, :cond_0

    .line 3126
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v17

    .line 3127
    .local v17, obbFiles:[Ljava/io/File;
    if-eqz v17, :cond_0

    .line 3128
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    .line 3129
    .local v9, obbDirName:Ljava/lang/String;
    move-object/from16 v12, v17

    .local v12, arr$:[Ljava/io/File;
    array-length v14, v12

    .local v14, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    :goto_0
    if-ge v13, v14, :cond_0

    aget-object v15, v12, v13

    .line 3130
    .local v15, obb:Ljava/io/File;
    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v7, "obb"

    const/4 v8, 0x0

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v11, p2

    invoke-static/range {v6 .. v11}, Landroid/app/backup/FullBackup;->backupToTar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/BackupDataOutput;)I

    .line 3129
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 3135
    .end local v9           #obbDirName:Ljava/lang/String;
    .end local v12           #arr$:[Ljava/io/File;
    .end local v13           #i$:I
    .end local v14           #len$:I
    .end local v15           #obb:Ljava/io/File;
    .end local v17           #obbFiles:[Ljava/io/File;
    :cond_0
    return-void
.end method

.method private writeAppManifest(Landroid/content/pm/PackageInfo;Ljava/io/File;Z)V
    .locals 10
    .parameter "pkg"
    .parameter "manifestFile"
    .parameter "withApk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3160
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v8, 0x1000

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3161
    .local v1, builder:Ljava/lang/StringBuilder;
    new-instance v6, Landroid/util/StringBuilderPrinter;

    invoke-direct {v6, v1}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    .line 3163
    .local v6, printer:Landroid/util/StringBuilderPrinter;
    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3164
    iget-object v8, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3165
    iget v8, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3166
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3168
    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v8}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v8

    iget-object v9, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3169
    .local v3, installerName:Ljava/lang/String;
    if-eqz v3, :cond_1

    .end local v3           #installerName:Ljava/lang/String;
    :goto_0
    invoke-virtual {v6, v3}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3171
    if-eqz p3, :cond_2

    const-string v8, "1"

    :goto_1
    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3172
    iget-object v8, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-nez v8, :cond_3

    .line 3173
    const-string v8, "0"

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3181
    :cond_0
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 3182
    .local v5, outstream:Ljava/io/FileOutputStream;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    invoke-static {p2}, Lcom/android/server/BackupManagerService$Injector;->resetManifestFileModifiedTime(Ljava/io/File;)V

    return-void

    .end local v5           #outstream:Ljava/io/FileOutputStream;
    .restart local v3       #installerName:Ljava/lang/String;
    :cond_1
    const-string v3, ""

    goto :goto_0

    .line 3171
    .end local v3           #installerName:Ljava/lang/String;
    :cond_2
    const-string v8, "0"

    goto :goto_1

    .line 3175
    :cond_3
    iget-object v8, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3176
    iget-object v0, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .local v0, arr$:[Landroid/content/pm/Signature;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_2
    if-ge v2, v4, :cond_0

    aget-object v7, v0, v2

    .line 3177
    .local v7, sig:Landroid/content/pm/Signature;
    invoke-virtual {v7}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    .line 3176
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method


# virtual methods
.method public run()V
    .locals 29

    .prologue
    .line 2768
    const-string v25, "BackupManagerService"

    const-string v26, "--- Performing full-dataset backup ---"

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2770
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 2771
    .local v21, packagesToBackup:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v17, Lcom/android/server/BackupManagerService$FullBackupObbConnection;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;-><init>(Lcom/android/server/BackupManagerService;)V

    .line 2772
    .local v17, obbConnection:Lcom/android/server/BackupManagerService$FullBackupObbConnection;
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->establish()V

    .line 2773
    const/16 v24, 0x0

    .line 2774
    .local v24, result:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendStartBackup()V

    .line 2777
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mAllApps:Z

    move/from16 v25, v0

    if-eqz v25, :cond_1

    .line 2778
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static/range {v25 .. v25}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v25

    const/16 v26, 0x40

    invoke-virtual/range {v25 .. v26}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v21

    .line 2781
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeSystem:Z

    move/from16 v25, v0

    if-nez v25, :cond_1

    .line 2782
    const/4 v14, 0x0

    .local v14, i:I
    :goto_0
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v25

    move/from16 v0, v25

    if-ge v14, v0, :cond_1

    .line 2783
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/content/pm/PackageInfo;

    .line 2784
    .local v22, pkg:Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v22

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v25, v0

    and-int/lit8 v25, v25, 0x1

    if-eqz v25, :cond_0

    .line 2785
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 2787
    :cond_0
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 2796
    .end local v14           #i:I
    .end local v22           #pkg:Landroid/content/pm/PackageInfo;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mPackages:[Ljava/lang/String;

    move-object/from16 v25, v0

    if-eqz v25, :cond_2

    .line 2797
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mPackages:[Ljava/lang/String;

    .local v5, arr$:[Ljava/lang/String;
    array-length v0, v5

    move/from16 v16, v0

    .local v16, len$:I
    const/4 v15, 0x0

    .local v15, i$:I
    :goto_1
    move/from16 v0, v16

    if-ge v15, v0, :cond_2

    aget-object v23, v5, v15

    .line 2799
    .local v23, pkgName:Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static/range {v25 .. v25}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v25

    const/16 v26, 0x40

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v25

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2797
    :goto_2
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 2801
    :catch_0
    move-exception v8

    .line 2802
    .local v8, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v25, "BackupManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Unknown package "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ", skipping"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2803
    const/16 v24, -0x2

    goto :goto_2

    .line 2811
    .end local v5           #arr$:[Ljava/lang/String;
    .end local v8           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v15           #i$:I
    .end local v16           #len$:I
    .end local v23           #pkgName:Ljava/lang/String;
    :cond_2
    const/4 v14, 0x0

    .restart local v14       #i:I
    :goto_3
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v25

    move/from16 v0, v25

    if-ge v14, v0, :cond_6

    .line 2812
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/content/pm/PackageInfo;

    .line 2813
    .restart local v22       #pkg:Landroid/content/pm/PackageInfo;
    sget-boolean v25, Lcom/android/server/BackupManagerService$Injector;->FALSE:Z

    if-nez v25, :cond_3

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mNoninteractive:Z

    move/from16 v25, v0

    if-eqz v25, :cond_4

    :cond_3
    move-object/from16 v0, v22

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v25, v0

    const-string v26, "com.android.sharedstoragebackup"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_5

    .line 2816
    :cond_4
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_3

    .line 2818
    :cond_5
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 2824
    .end local v22           #pkg:Landroid/content/pm/PackageInfo;
    :cond_6
    const/4 v14, 0x0

    :goto_4
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v25

    move/from16 v0, v25

    if-ge v14, v0, :cond_8

    .line 2825
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/content/pm/PackageInfo;

    .line 2826
    .restart local v22       #pkg:Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v22

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v25, v0

    const/16 v26, 0x2710

    move/from16 v0, v25

    move/from16 v1, v26

    if-ge v0, v1, :cond_7

    move-object/from16 v0, v22

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->backupAgentName:Ljava/lang/String;

    move-object/from16 v25, v0

    if-nez v25, :cond_7

    .line 2831
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_4

    .line 2833
    :cond_7
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 2837
    .end local v22           #pkg:Landroid/content/pm/PackageInfo;
    :cond_8
    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v25

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 2838
    .local v19, ofstream:Ljava/io/FileOutputStream;
    const/16 v20, 0x0

    .line 2840
    .local v20, out:Ljava/io/OutputStream;
    const/16 v22, 0x0

    .line 2842
    .restart local v22       #pkg:Landroid/content/pm/PackageInfo;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mEncryptPassword:Ljava/lang/String;

    move-object/from16 v25, v0

    if-eqz v25, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mEncryptPassword:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_a

    const/4 v9, 0x1

    .line 2843
    .local v9, encrypting:Z
    :goto_5
    const/4 v6, 0x1

    .line 2844
    .local v6, compressing:Z
    move-object/from16 v10, v19

    .line 2848
    .local v10, finalOutput:Ljava/io/OutputStream;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIgnoreEncryptionPasswordCheck:Z

    move/from16 v25, v0

    if-nez v25, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mCurrentPassword:Ljava/lang/String;

    move-object/from16 v26, v0

    #calls: Lcom/android/server/BackupManagerService;->backupPasswordMatches(Ljava/lang/String;)Z
    invoke-static/range {v25 .. v26}, Lcom/android/server/BackupManagerService;->access$1300(Lcom/android/server/BackupManagerService;Ljava/lang/String;)Z

    move-result v25

    if-nez v25, :cond_b

    .line 2849
    const-string v25, "BackupManagerService"

    const-string v26, "Backup password mismatch; aborting"

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2850
    new-instance v25, Ljava/lang/SecurityException;

    const-string v26, "Backup password mismatch; aborting"

    invoke-direct/range {v25 .. v26}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v25
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    .line 2937
    .end local v6           #compressing:Z
    .end local v9           #encrypting:Z
    .end local v10           #finalOutput:Ljava/io/OutputStream;
    :catch_1
    move-exception v8

    .line 2938
    .local v8, e:Landroid/os/RemoteException;
    :try_start_2
    const-string v25, "BackupManagerService"

    const-string v26, "App died during full backup"

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2939
    const/16 v24, -0x1

    .line 2948
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 2950
    if-eqz v20, :cond_9

    :try_start_3
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V

    .line 2951
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_b

    .line 2955
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2956
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/util/SparseArray;->clear()V

    .line 2957
    monitor-exit v26
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 2958
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2959
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    const/16 v27, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 2960
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->notifyAll()V

    .line 2961
    monitor-exit v26
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 2963
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackup()V

    .line 2964
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackupWithResult(I)V

    .line 2965
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->tearDown()V

    .line 2966
    const-string v25, "BackupManagerService"

    const-string v26, "Full backup pass complete."

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v25, v0

    .end local v8           #e:Landroid/os/RemoteException;
    :goto_7
    invoke-virtual/range {v25 .. v25}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 2969
    return-void

    .line 2842
    :cond_a
    const/4 v9, 0x0

    goto/16 :goto_5

    .line 2878
    .restart local v6       #compressing:Z
    .restart local v9       #encrypting:Z
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    :cond_b
    :try_start_6
    new-instance v13, Ljava/lang/StringBuilder;

    const/16 v25, 0x400

    move/from16 v0, v25

    invoke-direct {v13, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2880
    .local v13, headerbuf:Ljava/lang/StringBuilder;
    const-string v25, "ANDROID BACKUP\n"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2881
    const/16 v25, 0x2

    move/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2882
    if-eqz v6, :cond_e

    const-string v25, "\n1\n"

    :goto_8
    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 2886
    if-eqz v9, :cond_f

    .line 2887
    :try_start_7
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v10}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->emitAesBackupHeader(Ljava/lang/StringBuilder;Ljava/io/OutputStream;)Ljava/io/OutputStream;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_7 .. :try_end_7} :catch_4

    move-result-object v10

    move-object v11, v10

    .line 2892
    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .local v11, finalOutput:Ljava/io/OutputStream;
    :goto_9
    :try_start_8
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    const-string v26, "UTF-8"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    .line 2893
    .local v12, header:[B
    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/io/FileOutputStream;->write([B)V

    .line 2896
    if-eqz v6, :cond_16

    .line 2897
    new-instance v7, Ljava/util/zip/Deflater;

    const/16 v25, 0x9

    move/from16 v0, v25

    invoke-direct {v7, v0}, Ljava/util/zip/Deflater;-><init>(I)V

    .line 2898
    .local v7, deflater:Ljava/util/zip/Deflater;
    new-instance v10, Ljava/util/zip/DeflaterOutputStream;

    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-direct {v10, v11, v7, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_d
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_8 .. :try_end_8} :catch_4

    .line 2901
    .end local v7           #deflater:Ljava/util/zip/Deflater;
    .end local v11           #finalOutput:Ljava/io/OutputStream;
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    :goto_a
    move-object/from16 v20, v10

    .line 2909
    :try_start_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeShared:Z

    move/from16 v25, v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    if-eqz v25, :cond_c

    .line 2911
    :try_start_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static/range {v25 .. v25}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v25

    const-string v26, "com.android.sharedstoragebackup"

    const/16 v27, 0x0

    invoke-virtual/range {v25 .. v27}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v22

    .line 2912
    invoke-interface/range {v21 .. v22}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_a} :catch_5
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    .line 2920
    :cond_c
    :goto_b
    :try_start_b
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v4

    .line 2921
    .local v4, N:I
    const/4 v14, 0x0

    :goto_c
    if-ge v14, v4, :cond_12

    .line 2922
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    move-object/from16 v0, v25

    check-cast v0, Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    .line 2923
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    move/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->backupOnePackage(Landroid/content/pm/PackageInfo;Ljava/io/OutputStream;Z)V

    .line 2927
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mIncludeObbs:Z

    move/from16 v25, v0

    if-eqz v25, :cond_11

    .line 2928
    move-object/from16 v0, v17

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->backupObbs(Landroid/content/pm/PackageInfo;Ljava/io/OutputStream;)Z

    move-result v18

    .line 2929
    .local v18, obbOkay:Z
    if-nez v18, :cond_11

    .line 2930
    new-instance v25, Ljava/lang/RuntimeException;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Failure writing OBB stack for "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v25
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_b .. :try_end_b} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    .line 2940
    .end local v4           #N:I
    .end local v6           #compressing:Z
    .end local v9           #encrypting:Z
    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .end local v12           #header:[B
    .end local v13           #headerbuf:Ljava/lang/StringBuilder;
    .end local v18           #obbOkay:Z
    :catch_2
    move-exception v8

    .line 2941
    .local v8, e:Ljava/lang/SecurityException;
    const/16 v24, -0x4

    .line 2948
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 2950
    if-eqz v20, :cond_d

    :try_start_c
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V

    .line 2951
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_a

    .line 2955
    :goto_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2956
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/util/SparseArray;->clear()V

    .line 2957
    monitor-exit v26
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 2958
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2959
    :try_start_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    const/16 v27, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 2960
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->notifyAll()V

    .line 2961
    monitor-exit v26
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 2963
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackup()V

    .line 2964
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackupWithResult(I)V

    .line 2965
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->tearDown()V

    .line 2966
    const-string v25, "BackupManagerService"

    const-string v26, "Full backup pass complete."

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v25, v0

    goto/16 :goto_7

    .line 2882
    .end local v8           #e:Ljava/lang/SecurityException;
    .restart local v6       #compressing:Z
    .restart local v9       #encrypting:Z
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    .restart local v13       #headerbuf:Ljava/lang/StringBuilder;
    :cond_e
    :try_start_f
    const-string v25, "\n0\n"
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_f} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_f .. :try_end_f} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_f .. :try_end_f} :catch_4
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_6

    goto/16 :goto_8

    .line 2889
    :cond_f
    :try_start_10
    const-string v25, "none\n"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_3
    .catch Landroid/os/RemoteException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_10} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_10 .. :try_end_10} :catch_4

    move-object v11, v10

    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .restart local v11       #finalOutput:Ljava/io/OutputStream;
    goto/16 :goto_9

    .line 2902
    .end local v11           #finalOutput:Ljava/io/OutputStream;
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    :catch_3
    move-exception v8

    .line 2904
    .local v8, e:Ljava/lang/Exception;
    :goto_e
    :try_start_11
    const-string v25, "BackupManagerService"

    const-string v26, "Unable to emit archive header"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-static {v0, v1, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2905
    new-instance v25, Ljava/lang/Exception;

    const-string v26, "Unable to emit archive header"

    invoke-direct/range {v25 .. v26}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v25
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_11 .. :try_end_11} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_11} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_11 .. :try_end_11} :catch_4
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6

    .line 2942
    .end local v6           #compressing:Z
    .end local v8           #e:Ljava/lang/Exception;
    .end local v9           #encrypting:Z
    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .end local v13           #headerbuf:Ljava/lang/StringBuilder;
    :catch_4
    move-exception v8

    .line 2943
    .local v8, e:Ljava/util/concurrent/TimeoutException;
    const/16 v24, -0x3

    .line 2948
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 2950
    if-eqz v20, :cond_10

    :try_start_12
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V

    .line 2951
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_9

    .line 2955
    :goto_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2956
    :try_start_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/util/SparseArray;->clear()V

    .line 2957
    monitor-exit v26
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    .line 2958
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2959
    :try_start_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    const/16 v27, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 2960
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->notifyAll()V

    .line 2961
    monitor-exit v26
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    .line 2963
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackup()V

    .line 2964
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackupWithResult(I)V

    .line 2965
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->tearDown()V

    .line 2966
    const-string v25, "BackupManagerService"

    const-string v26, "Full backup pass complete."

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v25, v0

    goto/16 :goto_7

    .line 2913
    .end local v8           #e:Ljava/util/concurrent/TimeoutException;
    .restart local v6       #compressing:Z
    .restart local v9       #encrypting:Z
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    .restart local v12       #header:[B
    .restart local v13       #headerbuf:Ljava/lang/StringBuilder;
    :catch_5
    move-exception v8

    .line 2914
    .local v8, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_15
    const-string v25, "BackupManagerService"

    const-string v26, "Unable to find shared-storage backup handler"

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2915
    const/16 v24, -0x2

    goto/16 :goto_b

    .line 2921
    .end local v8           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v4       #N:I
    :cond_11
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_c

    .line 2936
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->finalizeBackup(Ljava/io/OutputStream;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_15 .. :try_end_15} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_15 .. :try_end_15} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_15 .. :try_end_15} :catch_4
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_6

    .line 2948
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 2950
    if-eqz v20, :cond_13

    :try_start_16
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V

    .line 2951
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_7

    .line 2955
    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2956
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/util/SparseArray;->clear()V

    .line 2957
    monitor-exit v26
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_b

    .line 2958
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2959
    :try_start_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    const/16 v27, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 2960
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->notifyAll()V

    .line 2961
    monitor-exit v26
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_c

    .line 2963
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackup()V

    .line 2964
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackupWithResult(I)V

    .line 2965
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->tearDown()V

    .line 2966
    const-string v25, "BackupManagerService"

    const-string v26, "Full backup pass complete."

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v25, v0

    goto/16 :goto_7

    .line 2944
    .end local v4           #N:I
    .end local v6           #compressing:Z
    .end local v9           #encrypting:Z
    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .end local v12           #header:[B
    .end local v13           #headerbuf:Ljava/lang/StringBuilder;
    :catch_6
    move-exception v8

    .line 2945
    .local v8, e:Ljava/lang/Exception;
    :try_start_19
    const-string v25, "BackupManagerService"

    const-string v26, "Internal exception during full backup"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-static {v0, v1, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    .line 2946
    const/16 v24, -0x1

    .line 2948
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 2950
    if-eqz v20, :cond_14

    :try_start_1a
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V

    .line 2951
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_8

    .line 2955
    :goto_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2956
    :try_start_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/util/SparseArray;->clear()V

    .line 2957
    monitor-exit v26
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_9

    .line 2958
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2959
    :try_start_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    const/16 v27, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 2960
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->notifyAll()V

    .line 2961
    monitor-exit v26
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_a

    .line 2963
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackup()V

    .line 2964
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackupWithResult(I)V

    .line 2965
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->tearDown()V

    .line 2966
    const-string v25, "BackupManagerService"

    const-string v26, "Full backup pass complete."

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v25, v0

    goto/16 :goto_7

    .line 2948
    .end local v8           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mShouldKillAfterBackup:Z

    move/from16 v26, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->tearDown(Landroid/content/pm/PackageInfo;Z)V

    .line 2950
    if-eqz v20, :cond_15

    :try_start_1d
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V

    .line 2951
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_1d} :catch_c

    .line 2955
    :goto_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2956
    :try_start_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/util/SparseArray;->clear()V

    .line 2957
    monitor-exit v26
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_1

    .line 2958
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v26, v0

    monitor-enter v26

    .line 2959
    :try_start_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 2960
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mLatchObject:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Object;->notifyAll()V

    .line 2961
    monitor-exit v26
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_2

    .line 2963
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackup()V

    .line 2964
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->sendEndBackupWithResult(I)V

    .line 2965
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/BackupManagerService$FullBackupObbConnection;->tearDown()V

    .line 2966
    const-string v26, "BackupManagerService"

    const-string v27, "Full backup pass complete."

    invoke-static/range {v26 .. v27}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 2948
    throw v25

    .line 2957
    :catchall_1
    move-exception v25

    :try_start_20
    monitor-exit v26
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_1

    throw v25

    .line 2961
    :catchall_2
    move-exception v25

    :try_start_21
    monitor-exit v26
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_2

    throw v25

    .line 2957
    .local v8, e:Landroid/os/RemoteException;
    :catchall_3
    move-exception v25

    :try_start_22
    monitor-exit v26
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_3

    throw v25

    .line 2961
    :catchall_4
    move-exception v25

    :try_start_23
    monitor-exit v26
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_4

    throw v25

    .line 2957
    .local v8, e:Ljava/lang/SecurityException;
    :catchall_5
    move-exception v25

    :try_start_24
    monitor-exit v26
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_5

    throw v25

    .line 2961
    :catchall_6
    move-exception v25

    :try_start_25
    monitor-exit v26
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_6

    throw v25

    .line 2957
    .local v8, e:Ljava/util/concurrent/TimeoutException;
    :catchall_7
    move-exception v25

    :try_start_26
    monitor-exit v26
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_7

    throw v25

    .line 2961
    :catchall_8
    move-exception v25

    :try_start_27
    monitor-exit v26
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_8

    throw v25

    .line 2957
    .local v8, e:Ljava/lang/Exception;
    :catchall_9
    move-exception v25

    :try_start_28
    monitor-exit v26
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_9

    throw v25

    .line 2961
    :catchall_a
    move-exception v25

    :try_start_29
    monitor-exit v26
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_a

    throw v25

    .line 2957
    .end local v8           #e:Ljava/lang/Exception;
    .restart local v4       #N:I
    .restart local v6       #compressing:Z
    .restart local v9       #encrypting:Z
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    .restart local v12       #header:[B
    .restart local v13       #headerbuf:Ljava/lang/StringBuilder;
    :catchall_b
    move-exception v25

    :try_start_2a
    monitor-exit v26
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_b

    throw v25

    .line 2961
    :catchall_c
    move-exception v25

    :try_start_2b
    monitor-exit v26
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_c

    throw v25

    .line 2952
    :catch_7
    move-exception v25

    goto/16 :goto_10

    .end local v4           #N:I
    .end local v6           #compressing:Z
    .end local v9           #encrypting:Z
    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .end local v12           #header:[B
    .end local v13           #headerbuf:Ljava/lang/StringBuilder;
    .restart local v8       #e:Ljava/lang/Exception;
    :catch_8
    move-exception v25

    goto/16 :goto_11

    .local v8, e:Ljava/util/concurrent/TimeoutException;
    :catch_9
    move-exception v25

    goto/16 :goto_f

    .local v8, e:Ljava/lang/SecurityException;
    :catch_a
    move-exception v25

    goto/16 :goto_d

    .local v8, e:Landroid/os/RemoteException;
    :catch_b
    move-exception v25

    goto/16 :goto_6

    .end local v8           #e:Landroid/os/RemoteException;
    :catch_c
    move-exception v26

    goto/16 :goto_12

    .line 2902
    .restart local v6       #compressing:Z
    .restart local v9       #encrypting:Z
    .restart local v11       #finalOutput:Ljava/io/OutputStream;
    .restart local v13       #headerbuf:Ljava/lang/StringBuilder;
    :catch_d
    move-exception v8

    move-object v10, v11

    .end local v11           #finalOutput:Ljava/io/OutputStream;
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    goto/16 :goto_e

    .end local v10           #finalOutput:Ljava/io/OutputStream;
    .restart local v11       #finalOutput:Ljava/io/OutputStream;
    .restart local v12       #header:[B
    :cond_16
    move-object v10, v11

    .end local v11           #finalOutput:Ljava/io/OutputStream;
    .restart local v10       #finalOutput:Ljava/io/OutputStream;
    goto/16 :goto_a
.end method

.method sendEndBackup()V
    .locals 3

    .prologue
    .line 3234
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    if-eqz v1, :cond_0

    .line 3236
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v1}, Landroid/app/backup/IFullBackupRestoreObserver;->onEndBackup()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3242
    :cond_0
    :goto_0
    return-void

    .line 3237
    :catch_0
    move-exception v0

    .line 3238
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BackupManagerService"

    const-string v2, "full backup observer went away: endBackup"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3239
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    goto :goto_0
.end method

.method sendEndBackupWithResult(I)V
    .locals 3
    .parameter "result"

    .prologue
    .line 3245
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    if-eqz v1, :cond_0

    .line 3247
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v1, p1}, Landroid/app/backup/IFullBackupRestoreObserver;->onEndBackupWithResult(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3253
    :cond_0
    :goto_0
    return-void

    .line 3248
    :catch_0
    move-exception v0

    .line 3249
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BackupManagerService"

    const-string v2, "full backup observer went away: endBackup with result"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3250
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    goto :goto_0
.end method

.method sendOnBackupPackage(Ljava/lang/String;)V
    .locals 3
    .parameter "name"

    .prologue
    .line 3222
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    if-eqz v1, :cond_0

    .line 3225
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v1, p1}, Landroid/app/backup/IFullBackupRestoreObserver;->onBackupPackage(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3231
    :cond_0
    :goto_0
    return-void

    .line 3226
    :catch_0
    move-exception v0

    .line 3227
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BackupManagerService"

    const-string v2, "full backup observer went away: backupPackage"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3228
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    goto :goto_0
.end method

.method sendStartBackup()V
    .locals 3

    .prologue
    .line 3211
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    if-eqz v1, :cond_0

    .line 3213
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v1}, Landroid/app/backup/IFullBackupRestoreObserver;->onStartBackup()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3219
    :cond_0
    :goto_0
    return-void

    .line 3214
    :catch_0
    move-exception v0

    .line 3215
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BackupManagerService"

    const-string v2, "full backup observer went away: startBackup"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3216
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/BackupManagerService$PerformFullBackupTask;->mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

    goto :goto_0
.end method

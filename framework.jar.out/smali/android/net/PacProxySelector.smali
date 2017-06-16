.class public Landroid/net/PacProxySelector;
.super Ljava/net/ProxySelector;
.source "PacProxySelector.java"


# static fields
.field public static final PROXY_SERVICE:Ljava/lang/String; = "com.android.net.IProxyService"

.field private static final TAG:Ljava/lang/String; = "PacProxySelector"


# instance fields
.field private final mDefaultList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field private mProxyService:Lcom/android/net/IProxyService;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/net/ProxySelector;-><init>()V

    .line 47
    const-string v0, "com.android.net.IProxyService"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/net/IProxyService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/net/IProxyService;

    move-result-object v0

    iput-object v0, p0, Landroid/net/PacProxySelector;->mProxyService:Lcom/android/net/IProxyService;

    .line 49
    iget-object v0, p0, Landroid/net/PacProxySelector;->mProxyService:Lcom/android/net/IProxyService;

    if-nez v0, :cond_0

    .line 51
    const-string v0, "PacProxySelector"

    const-string v1, "PacManager: no proxy service"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/net/Proxy;

    const/4 v1, 0x0

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/collect/Lists;->newArrayList([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Landroid/net/PacProxySelector;->mDefaultList:Ljava/util/List;

    .line 54
    return-void
.end method

.method private static parseResponse(Ljava/lang/String;)Ljava/util/List;
    .locals 14
    .parameter "response"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    const-string v11, ";"

    invoke-virtual {p0, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 95
    .local v9, split:[Ljava/lang/String;
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v7

    .line 96
    .local v7, ret:Ljava/util/List;,"Ljava/util/List<Ljava/net/Proxy;>;"
    move-object v0, v9

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v8, v0, v4

    .line 97
    .local v8, s:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 98
    .local v10, trimmed:Ljava/lang/String;
    const-string v11, "DIRECT"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 99
    sget-object v11, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 100
    :cond_1
    const-string v11, "PROXY "

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 101
    const/4 v11, 0x6

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 102
    .local v3, hostPort:[Ljava/lang/String;
    const/4 v11, 0x0

    aget-object v2, v3, v11

    .line 105
    .local v2, host:Ljava/lang/String;
    const/4 v11, 0x1

    :try_start_0
    aget-object v11, v3, v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 109
    .local v6, port:I
    :goto_2
    new-instance v11, Ljava/net/Proxy;

    sget-object v12, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-static {v2, v6}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 106
    .end local v6           #port:I
    :catch_0
    move-exception v1

    .line 107
    .local v1, e:Ljava/lang/Exception;
    const/16 v6, 0x1f90

    .restart local v6       #port:I
    goto :goto_2

    .line 112
    .end local v1           #e:Ljava/lang/Exception;
    .end local v2           #host:Ljava/lang/String;
    .end local v3           #hostPort:[Ljava/lang/String;
    .end local v6           #port:I
    .end local v8           #s:Ljava/lang/String;
    .end local v10           #trimmed:Ljava/lang/String;
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v11

    if-nez v11, :cond_3

    .line 113
    sget-object v11, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    :cond_3
    return-object v7
.end method


# virtual methods
.method public connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V
    .locals 0
    .parameter "uri"
    .parameter "address"
    .parameter "failure"

    .prologue
    .line 121
    return-void
.end method

.method public select(Ljava/net/URI;)Ljava/util/List;
    .locals 11
    .parameter "uri"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v1, p0, Landroid/net/PacProxySelector;->mProxyService:Lcom/android/net/IProxyService;

    if-nez v1, :cond_0

    .line 59
    const-string v1, "com.android.net.IProxyService"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/net/IProxyService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/net/IProxyService;

    move-result-object v1

    iput-object v1, p0, Landroid/net/PacProxySelector;->mProxyService:Lcom/android/net/IProxyService;

    .line 62
    :cond_0
    iget-object v1, p0, Landroid/net/PacProxySelector;->mProxyService:Lcom/android/net/IProxyService;

    if-nez v1, :cond_1

    .line 63
    const-string v1, "PacProxySelector"

    const-string/jumbo v2, "select: no proxy service return NO_PROXY"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/net/Proxy;

    const/4 v2, 0x0

    sget-object v3, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/google/android/collect/Lists;->newArrayList([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 90
    :goto_0
    return-object v1

    .line 66
    :cond_1
    const/4 v9, 0x0

    .line 72
    .local v9, response:Ljava/lang/String;
    :try_start_0
    const-string v1, "http"

    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 73
    new-instance v0, Ljava/net/URI;

    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v4

    const-string v5, "/"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .end local p1
    .local v0, uri:Ljava/net/URI;
    move-object p1, v0

    .line 75
    .end local v0           #uri:Ljava/net/URI;
    .restart local p1
    :cond_2
    invoke-virtual {p1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v10

    .line 82
    .local v10, urlString:Ljava/lang/String;
    :goto_1
    :try_start_1
    iget-object v1, p0, Landroid/net/PacProxySelector;->mProxyService:Lcom/android/net/IProxyService;

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v10}, Lcom/android/net/IProxyService;->resolvePacFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v9

    .line 86
    :goto_2
    if-nez v9, :cond_3

    .line 87
    iget-object v1, p0, Landroid/net/PacProxySelector;->mDefaultList:Ljava/util/List;

    goto :goto_0

    .line 76
    .end local v10           #urlString:Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 77
    .local v8, e:Ljava/net/URISyntaxException;
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v10

    .line 80
    .restart local v10       #urlString:Ljava/lang/String;
    goto :goto_1

    .line 78
    .end local v8           #e:Ljava/net/URISyntaxException;
    .end local v10           #urlString:Ljava/lang/String;
    :catch_1
    move-exception v8

    .line 79
    .local v8, e:Ljava/net/MalformedURLException;
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v10

    .restart local v10       #urlString:Ljava/lang/String;
    goto :goto_1

    .line 83
    .end local v8           #e:Ljava/net/MalformedURLException;
    :catch_2
    move-exception v8

    .line 84
    .local v8, e:Landroid/os/RemoteException;
    invoke-virtual {v8}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_2

    .line 90
    .end local v8           #e:Landroid/os/RemoteException;
    :cond_3
    invoke-static {v9}, Landroid/net/PacProxySelector;->parseResponse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method

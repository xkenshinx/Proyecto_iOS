//
//  Artista.h
//  KenSpotifyStreamer
//
//  Created by Kenshin on 8/28/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artista : NSObject

@property (nonatomic,strong) NSString* artista;
@property (nonatomic,strong) NSArray* cancion;

+(NSArray*)getListaArtistas;

+(NSArray*)getListaCanciones;


@end

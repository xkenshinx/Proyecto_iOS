//
//  ArtistaViewController.m
//  KenSpotifyStreamer
//
//  Created by Kenshin on 8/15/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import "ArtistaViewController.h"
#import <Spotify/Spotify.h>
#import "ArtistaCustomCell.h"
#import "SpotifySession.h"
#import "CancionViewController.h"

@interface ArtistaViewController ()

@property (nonatomic,strong) NSMutableArray* artistas;

@end

@implementation ArtistaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ArtistaSearchBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Search Bar and Spotify Search

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"Texto en el Search: \n%@", searchBar.text);
    [SpotifySession buscaArtista:searchBar.text withTarget:self];
}

-(void) updateArtista:(NSMutableArray *)nuevoArtista{
    self.artistas = nuevoArtista;
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
        return self.artistas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArtistaCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistaCustomCell" forIndexPath:indexPath];
    
    // Datos de Spotify
    SPTArtist* artist = self.artistas[indexPath.row];
    NSLog(@"Texto en el Artista: \n%@", artist.name);
    cell.nombreArtista.text = artist.name;

    /*
    if ([artist.images count] > 0) {
        SPTImage* image = [artist.images objectAtIndex:0];
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: image.imageURL];
            if ( data == nil ){
                NSLog(@"Error en Imagen del Artista %@ ", artist.name);
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.ImagenArtista.image = [UIImage imageWithData: data];
            });
        });
    }
    else{
        NSLog(@"No hay imagenes en el Artista %@ ", artist.name);
    }
    */
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    if ([segue.identifier isEqualToString:@"segueCancion"]) {
        NSLog(@"Lanzando Segue");
        NSIndexPath* indexPath = [self.tableView indexPathForCell:sender];
        SPTArtist* artista = [self.artistas objectAtIndex:indexPath.row];

        CancionViewController* cancionListController = segue.destinationViewController;
        
        cancionListController.artista = artista;
    }
}



@end

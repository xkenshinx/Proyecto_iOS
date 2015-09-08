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

/*-(void) requestBusquedaArtista:(NSString *)nombreArtista{
    [SpotifySession buscaArtista];
}
*/

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
    
    // Configure the cell...
    SPTArtist* artist = self.artistas[indexPath.row];
    cell.nombreArtista.text = artist.name;
    
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
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
